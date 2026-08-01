local _, LMP = ...

LMP.tracks = LMP.tracks or {}
LMP.currentIndex = LMP.currentIndex or 1
LMP.status = "stopped"
LMP.mode = "sequence"
LMP.random = math.random

local modeOrder = {
    sequence = "repeat-one",
    ["repeat-one"] = "shuffle",
    shuffle = "sequence",
}

local function printMessage(message)
    if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
        DEFAULT_CHAT_FRAME:AddMessage("|cff33d1b2旅店留声机：|r" .. message)
    end
end

function LMP:NotifyStateChanged()
    if self.stateChanged then
        self.stateChanged(self)
    end
end

function LMP:SetStateChanged(callback)
    self.stateChanged = callback
end

function LMP:AddTrack(track)
    if type(track) ~= "table"
        or type(track.title) ~= "string"
        or not track.artist
        or (type(track.path) ~= "string" and type(track.path) ~= "number")
        or type(track.duration) ~= "number" then
        return false
    end

    track.artist = track.artist or "未知艺术家"
    track.duration = math.max(1, math.floor(tonumber(track.duration)))
    track.source = track.source == "local" and "local" or "builtin"
    table.insert(self.tracks, track)
    return true
end

function LMP:CancelTimer()
    if self.trackTimer then
        self.trackTimer:Cancel()
        self.trackTimer = nil
    end
end

function LMP:StopCurrentSound()
    if self.soundHandle then
        StopSound(self.soundHandle)
        self.soundHandle = nil
    end
    -- Stop the music channel in case the track was played as music (isMusic=true)
    StopMusic()
end

function LMP:GetCurrentTrack()
    return self.tracks[self.currentIndex]
end

function LMP:GetElapsed()
    if self.status ~= "playing" or not self.startedAt then
        return 0
    end

    local elapsed = math.max(0, GetTime() - self.startedAt)
    local track = self:GetCurrentTrack()
    if track then
        return math.min(elapsed, track.duration)
    end
    return elapsed
end

function LMP:ChooseNextIndex()
    local count = #self.tracks
    if count == 0 then
        return nil
    end
    if self.mode == "repeat-one" then
        return self.currentIndex
    end
    if self.mode == "shuffle" then
        local nextIndex = self.random(1, count)
        if count > 1 and nextIndex == self.currentIndex then
            nextIndex = nextIndex % count + 1
        end
        return nextIndex
    end
    return self.currentIndex % count + 1
end

function LMP:OnTrackFinished()
    self.trackTimer = nil
    self.soundHandle = nil
    local nextIndex = self:ChooseNextIndex()
    if nextIndex then
        self:Play(nextIndex)
    else
        self.status = "stopped"
        self.startedAt = nil
        self:NotifyStateChanged()
    end
end

function LMP:Play(index)
    if #self.tracks == 0 then
        return false
    end

    index = tonumber(index) or self.currentIndex or 1
    index = math.floor(index)
    if index < 1 or index > #self.tracks then
        return false
    end

    self:CancelTimer()
    self:StopCurrentSound()
    self.currentIndex = index
    self.startedAt = nil

    local track = self.tracks[index]
    local willPlay, handle = PlaySoundFile(track.path, "Master", false, true)
    if not willPlay then
        self.status = "stopped"
        printMessage(("无法播放“%s”：(ID/Path: %s)"):format(track.title, tostring(track.path)))
        self:NotifyStateChanged()
        return false
    end

    self.soundHandle = handle
    self.status = "playing"
    self.startedAt = GetTime()
    self.trackTimer = C_Timer.NewTimer(track.duration, function()
        self:OnTrackFinished()
    end)
    self:NotifyStateChanged()
    return true
end

function LMP:Pause()
    if self.status ~= "playing" then
        return false
    end

    self:CancelTimer()
    self:StopCurrentSound()
    self.status = "paused"
    self.startedAt = nil
    self:NotifyStateChanged()
    return true
end

function LMP:Stop()
    self:CancelTimer()
    self:StopCurrentSound()
    self.status = "stopped"
    self.startedAt = nil
    self:NotifyStateChanged()
    return true
end

function LMP:Next()
    local nextIndex = self:ChooseNextIndex()
    if self.mode == "repeat-one" and #self.tracks > 0 then
        nextIndex = self.currentIndex % #self.tracks + 1
    end
    return nextIndex and self:Play(nextIndex) or false
end

function LMP:Previous()
    local count = #self.tracks
    if count == 0 then
        return false
    end
    local previousIndex = (self.currentIndex - 2) % count + 1
    return self:Play(previousIndex)
end

function LMP:CycleMode()
    self.mode = modeOrder[self.mode] or "sequence"
    if type(InnGramophoneDB) == "table" then
        InnGramophoneDB.mode = self.mode
    end
    self:NotifyStateChanged()
    return self.mode
end

function LMP:LoadSettings()
    InnGramophoneDB = type(InnGramophoneDB) == "table" and InnGramophoneDB or {}
    if modeOrder[InnGramophoneDB.mode] then
        self.mode = InnGramophoneDB.mode
    end
end
