local _, addonTable = ...

local PANEL_BREADCRUMB_GAP = 24

local function GetHeaderWidth(header)
    if header.GetUnboundedStringWidth then
        return header:GetUnboundedStringWidth()
    end
    return header:GetStringWidth()
end

local function SetPanelTitle(panel, title, breadcrumb)
    if not panel then return end

    local header = panel.header
    if header then
        header:SetText(title or "")
        header:SetWidth(GetHeaderWidth(header))
    end

    local crumb = panel.breadcrumb
    if crumb then
        crumb:SetText(breadcrumb or "")
        crumb:ClearAllPoints()
        if breadcrumb and breadcrumb ~= "" and header then
            crumb:SetPoint(
                "LEFT", header, "RIGHT", PANEL_BREADCRUMB_GAP, 0)
        end
    end

    panel.__gwPlusTitleManaged = true
end

addonTable.SetPanelTitle = SetPanelTitle
