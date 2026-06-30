
BugGrabberDB = {
["session"] = 1750,
["lastSanitation"] = 3,
["errors"] = {
{
["message"] = "Interface/AddOns/RXPGuides/Targeting.lua:558: attempt to index field 'text' (a nil value)",
["time"] = "2026/02/07 23:22:44",
["locals"] = "self = StaticPopup1 {\n BottomLeftCorner = Texture {\n }\n RightEdge = Texture {\n }\n visibleButtons = <table> {\n }\n TopEdge = Texture {\n }\n ButtonContainer = Frame {\n }\n LeftEdge = Texture {\n }\n SubText = FontString {\n }\n MoneyInputFrame = StaticPopup1MoneyInputFrame {\n }\n Spinner = Frame {\n }\n MoneyFrame = StaticPopup1MoneyFrame {\n }\n timeleft = 20\n Separator = Texture {\n }\n TopSpacer = FontString {\n }\n CoverFrame = Frame {\n }\n PixelSnapDisabled = true\n ProgressBarBorder = Texture {\n }\n BottomRightCorner = Texture {\n }\n which = \"QUIT\"\n hideOnEscape = 1\n ItemFrame = Frame {\n }\n previousRegionKey = \"ButtonContainer\"\n BottomEdge = Texture {\n }\n template = \"Transparent\"\n EditBox = StaticPopup1EditBox {\n }\n BG = Frame {\n }\n TopLeftCorner = Texture {\n }\n DarkOverlay = Frame {\n }\n ProgressBarFill = Texture {\n }\n Center = Texture {\n }\n ProgressBarSpacer = Texture {\n }\n backdropInfo = <table> {\n }\n AlertIcon = Texture {\n }\n numButtons = 2\n TopRightCorner = Texture {\n }\n dialogInfo = <table> {\n }\n Text = StaticPopup1Text {\n }\n CloseButton = StaticPopup1CloseButton {\n }\n Dropdown = Button {\n }\n Buttons = <table> {\n }\n ExtraButton = StaticPopup1ExtraButton {\n }\n heightPadding = 16\n}\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field 'text' (a nil value)\"\nactionForbiddenText = \"RXPGuides已被禁用，因为该功能只对暴雪的UI开放。\n你可以禁用这个插件并重新装载UI。\"\n",
["stack"] = "[Interface/AddOns/RXPGuides/Targeting.lua]:558: in function <Interface/AddOns/RXPGuides/Targeting.lua:557>\n[C]: ?\n[C]: ?\n[C]: in function 'Show'\n[Interface/AddOns/Blizzard_StaticPopup/StaticPopup.lua]:390: in function <...nterface/AddOns/Blizzard_StaticPopup/StaticPopup.lua:277>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function 'StaticPopup_Show'\n[Interface/AddOns/Blizzard_UIParent/Vanilla/UIParent.lua]:468: in function <...erface/AddOns/Blizzard_UIParent/Vanilla/UIParent.lua:358>\n[C]: ?",
["session"] = 1746,
["counter"] = 2,
},
{
["message"] = "[ADDON_ACTION_FORBIDDEN] 插件 'WeakAuras' 尝试调用保护功能 'UNKNOWN()'。",
["time"] = 1782845734,
["locals"] = "self = <table> {\n}\nevent = \"ADDON_ACTION_FORBIDDEN\"\naddonName = \"WeakAuras\"\naddonFunc = \"UNKNOWN()\"\nname = \"WeakAuras\"\nbadAddons = <table> {\n WeakAuras = true\n}\nL = <table> {\n NO_DISPLAY_2 = \"|cffffff00标准的错误显示插件名叫 BugSack，可以在找到 !BugGrabber 的网站上找到它。|r\"\n ERROR_DETECTED = \"%s |cffffff00已抓取，点击链接获取更多信息。|r\"\n BUGGRABBER_STOPPED = \"|cffffff00用户界面有太多的错误。所以，游戏体验会被降低。如不想再看到此信息请禁用或升级失效插件。|r\"\n USAGE = \"|cffffff00用法：/buggrabber <1-%d>。|r\"\n STOP_NAG = \"|cffffff00!BugGrabber 将不再提示缺失错误显示插件信息知道下个版本发布。|r\"\n NO_DISPLAY_STOP = \"|cffffff00如果你不希望再次被提醒，请输入 /stopnag。|r\"\n NO_DISPLAY_1 = \"|cffffff00似乎没有与 !BugGrabber 一起运行的错误显示插件。虽然斜线命令访问错误报告，但错误显示插件可以以更快捷的方式帮助您管理这些错误。|r\"\n ERROR_UNABLE = \"|cffffff00!BugGrabber 本身无法检索其他玩家的错误。请安装 BugSack 或类似的错误显示插件，可能会包含这些功能。|r\"\n ADDON_CALL_PROTECTED = \"[%s] 插件 '%s' 尝试调用保护功能 '%s'。\"\n}\n",
["stack"] = "[Interface/AddOns/!BugGrabber/BugGrabber.lua]:554: in function '?'\n[Interface/AddOns/!BugGrabber/BugGrabber.lua]:538: in function <Interface/AddOns/!BugGrabber/BugGrabber.lua:538>\n[C]: ?\n[C]: in function 'EventStoreUISetShown'\n[Interface/AddOns/Blizzard_StoreUI/Classic/Blizzard_StoreUIInbound.lua]:10: in function 'StoreFrame_SetShown'\n[Interface/AddOns/Blizzard_UIParent/Classic/UIParent.lua]:26: in function 'ToggleStoreUI'\n[return function() local chatFrame = SELECTED_DOCK_FRAME]:9: in function <[string \"return function() local chatFrame = SELECTE...\"]:8>\n",
["session"] = 1750,
["counter"] = 1,
},
},
}
