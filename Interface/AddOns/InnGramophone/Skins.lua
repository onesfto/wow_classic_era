local _, LMP = ...

LMP.Skins = {}

LMP.Skins["Default"] = {
    name = "原生经典",
    panel = {0, 0, 0, 0.85}, -- Slightly transparent black to show parchment
    sidebar = {0, 0, 0, 0}, -- Transparent for default so backdrop shows
    row = {0.05, 0.05, 0.05, 0.4},
    rowHover = {0.3, 0.25, 0.15, 0.6},
    accent = {1, 0.82, 0}, -- Classic Gold
    amber = {0.94, 0.65, 0.20, 1},
    border = {0.6, 0.6, 0.6, 1},
    muted = {0.7, 0.7, 0.7, 1},
    -- Special UI textures for Classic
    backdrop = {
        bgFile = "Interface\\TutorialFrame\\TutorialFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    }
}

LMP.Skins["Flat"] = {
    name = "扁平深色",
    panel = {0.035, 0.043, 0.047, 0.98},
    sidebar = {0.055, 0.063, 0.066, 1},
    row = {0.075, 0.082, 0.084, 0.88},
    rowHover = {0.11, 0.125, 0.125, 1},
    accent = {0.16, 0.82, 0.69, 1},
    amber = {0.94, 0.65, 0.20, 1},
    border = {0.18, 0.20, 0.20, 1},
    muted = {0.55, 0.59, 0.59, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["MC"] = {
    name = "熔火之心",
    panel = {0.08, 0.02, 0.01, 0.95},
    sidebar = {0.12, 0.03, 0.01, 1},
    row = {0.15, 0.04, 0.01, 0.85},
    rowHover = {0.3, 0.1, 0.02, 1},
    accent = {1.0, 0.4, 0.1, 1}, -- Lava orange
    amber = {1.0, 0.8, 0.2, 1},
    border = {0.3, 0.05, 0.02, 1},
    muted = {0.6, 0.4, 0.3, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["BWL"] = {
    name = "黑翼之巢",
    panel = {0.05, 0.01, 0.08, 0.95},
    sidebar = {0.08, 0.02, 0.12, 1},
    row = {0.1, 0.03, 0.15, 0.85},
    rowHover = {0.2, 0.05, 0.25, 1},
    accent = {0.8, 0.2, 0.9, 1}, -- Shadow flame purple
    amber = {0.9, 0.5, 0.2, 1},
    border = {0.25, 0.05, 0.35, 1},
    muted = {0.5, 0.4, 0.6, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["AQ"] = {
    name = "安其拉神庙",
    panel = {0.07, 0.07, 0.04, 0.95},
    sidebar = {0.1, 0.1, 0.06, 1},
    row = {0.12, 0.12, 0.08, 0.85},
    rowHover = {0.2, 0.2, 0.12, 1},
    accent = {0.4, 0.9, 0.5, 1}, -- Qiraji green
    amber = {0.8, 0.6, 0.2, 1},
    border = {0.3, 0.3, 0.15, 1},
    muted = {0.6, 0.6, 0.5, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["Naxx"] = {
    name = "纳克萨玛斯",
    panel = {0.02, 0.05, 0.06, 0.95},
    sidebar = {0.03, 0.08, 0.09, 1},
    row = {0.04, 0.1, 0.12, 0.85},
    rowHover = {0.06, 0.18, 0.22, 1},
    accent = {0.3, 0.8, 1.0, 1}, -- Frost blue
    amber = {0.6, 0.9, 0.4, 1}, -- Plague green
    border = {0.1, 0.25, 0.3, 1},
    muted = {0.4, 0.6, 0.7, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["ElvUI"] = {
    name = "ElvUI",
    panel = {0.1, 0.1, 0.1, 0.9},
    sidebar = {0.12, 0.12, 0.12, 1},
    row = {0.15, 0.15, 0.15, 0.85},
    rowHover = {0.2, 0.2, 0.2, 1},
    accent = {0.4, 0.7, 1.0, 1},
    amber = {1, 0.8, 0, 1},
    border = {0, 0, 0, 1}, -- Sharp black border
    muted = {0.6, 0.6, 0.6, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["GW2"] = {
    name = "GW2 UI",
    panel = {0.9, 0.88, 0.82, 0.98}, -- Ivory/Cream
    sidebar = {0.85, 0.82, 0.75, 1},
    row = {0.8, 0.78, 0.72, 0.85},
    rowHover = {0.95, 0.92, 0.85, 1},
    accent = {0.7, 0.1, 0.1, 1}, -- Deep GW2 red
    amber = {0.8, 0.4, 0, 1},
    border = {0.4, 0.35, 0.3, 1},
    muted = {0.4, 0.4, 0.4, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.Skins["NDui"] = {
    name = "NDui",
    panel = {0, 0, 0, 0.6},
    sidebar = {0, 0, 0, 0.8},
    row = {0, 0, 0, 0.4},
    rowHover = {0.2, 0.2, 0.2, 0.6},
    accent = {0.0, 0.8, 1.0, 1},
    amber = {1, 0.6, 0, 1},
    border = {0, 0, 0, 1},
    muted = {0.7, 0.7, 0.7, 1},
    backdrop = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    }
}

LMP.SkinOrder = {
    "Default", "Flat", "MC", "BWL", "AQ", "Naxx", "ElvUI", "GW2", "NDui"
}
