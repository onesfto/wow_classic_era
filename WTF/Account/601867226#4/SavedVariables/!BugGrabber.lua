
BugGrabberDB = {
["lastSanitation"] = 3,
["session"] = 1747,
["errors"] = {
{
["message"] = "[ADDON_ACTION_FORBIDDEN] 插件 'RXPGuides' 尝试调用保护功能 'TargetUnit()'。",
["time"] = 1782839617,
["locals"] = "self = <table> {\n}\nevent = \"ADDON_ACTION_FORBIDDEN\"\naddonName = \"RXPGuides\"\naddonFunc = \"TargetUnit()\"\nname = \"RXPGuides\"\nbadAddons = <table> {\n RXPGuides = true\n}\nL = <table> {\n NO_DISPLAY_2 = \"|cffffff00标准的错误显示插件名叫 BugSack，可以在找到 !BugGrabber 的网站上找到它。|r\"\n ERROR_DETECTED = \"%s |cffffff00已抓取，点击链接获取更多信息。|r\"\n BUGGRABBER_STOPPED = \"|cffffff00用户界面有太多的错误。所以，游戏体验会被降低。如不想再看到此信息请禁用或升级失效插件。|r\"\n USAGE = \"|cffffff00用法：/buggrabber <1-%d>。|r\"\n STOP_NAG = \"|cffffff00!BugGrabber 将不再提示缺失错误显示插件信息知道下个版本发布。|r\"\n NO_DISPLAY_STOP = \"|cffffff00如果你不希望再次被提醒，请输入 /stopnag。|r\"\n NO_DISPLAY_1 = \"|cffffff00似乎没有与 !BugGrabber 一起运行的错误显示插件。虽然斜线命令访问错误报告，但错误显示插件可以以更快捷的方式帮助您管理这些错误。|r\"\n ERROR_UNABLE = \"|cffffff00!BugGrabber 本身无法检索其他玩家的错误。请安装 BugSack 或类似的错误显示插件，可能会包含这些功能。|r\"\n ADDON_CALL_PROTECTED = \"[%s] 插件 '%s' 尝试调用保护功能 '%s'。\"\n}\n",
["stack"] = "[Interface/AddOns/!BugGrabber/BugGrabber.lua]:554: in function '?'\n[Interface/AddOns/!BugGrabber/BugGrabber.lua]:538: in function <Interface/AddOns/!BugGrabber/BugGrabber.lua:538>\n[C]: ?\n[Interface/AddOns/RXPGuides/Targeting.lua]:509: in function <Interface/AddOns/RXPGuides/Targeting.lua:486>\n[C]: ?\n[C]: ?\n",
["session"] = 1747,
["counter"] = 1,
},
{
["message"] = "Interface/AddOns/RXPGuides/Targeting.lua:558: attempt to index field 'text' (a nil value)",
["time"] = 1782839684,
["locals"] = "self = StaticPopup1 {\n TopSpacer = FontString {\n }\n visibleButtons = <table> {\n }\n CoverFrame = Frame {\n }\n previousRegionKey = \"ButtonContainer\"\n ProgressBarSpacer = Texture {\n }\n DarkOverlay = Frame {\n }\n timeleft = 0\n ButtonContainer = Frame {\n }\n dialogInfo = <table> {\n }\n which = \"DECURSIVE_NOTICE_FRAME\"\n hideOnEscape = false\n ItemFrame = Frame {\n }\n MoneyInputFrame = StaticPopup1MoneyInputFrame {\n }\n AlertIcon = Texture {\n }\n ProgressBarFill = Texture {\n }\n ExtraButton = StaticPopup1ExtraButton {\n }\n Buttons = <table> {\n }\n BG = Frame {\n }\n EditBox = StaticPopup1EditBox {\n }\n ProgressBarBorder = Texture {\n }\n Dropdown = Button {\n }\n SubText = FontString {\n }\n heightPadding = 16\n Spinner = Frame {\n }\n numButtons = 1\n MoneyFrame = StaticPopup1MoneyFrame {\n }\n Text = StaticPopup1Text {\n }\n CloseButton = StaticPopup1CloseButton {\n }\n Separator = Texture {\n }\n}\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field 'text' (a nil value)\"\nactionForbiddenText = \"RXPGuides已被禁用，因为该功能只对暴雪的UI开放。\n你可以禁用这个插件并重新装载UI。\"\n",
["stack"] = "[Interface/AddOns/RXPGuides/Targeting.lua]:558: in function <Interface/AddOns/RXPGuides/Targeting.lua:557>\n[C]: ?\n[C]: in function 'Show'\n[Interface/AddOns/Blizzard_StaticPopup/StaticPopup.lua]:390: in function <...nterface/AddOns/Blizzard_StaticPopup/StaticPopup.lua:277>\n[C]: ?\n[C]: in function 'StaticPopup_Show'\n[Interface/AddOns/Decursive/Dcr_DIAG.lua]:877: in function '_ShowNotice'\n[Interface/AddOns/Decursive/DCR_init.lua]:1027: in function 'VersionWarnings'\n[Interface/AddOns/Decursive/DCR_init.lua]:1477: in function 'SetConfiguration'\n[Interface/AddOns/Decursive/DCR_init.lua]:1240: in function <Interface/AddOns/Decursive/DCR_init.lua:1155>\n[C]: ?\n[Interface/AddOns/BiSTracker/Libs/AceAddon-3.0/AceAddon-3.0.lua]:66: in function <...AddOns/BiSTracker/Libs/AceAddon-3.0/AceAddon-3.0.lua:61>\n[Interface/AddOns/BiSTracker/Libs/AceAddon-3.0/AceAddon-3.0.lua]:523: in function 'EnableAddon'\n[Interface/AddOns/BiSTracker/Libs/AceAddon-3.0/AceAddon-3.0.lua]:626: in function <...AddOns/BiSTracker/Libs/AceAddon-3.0/AceAddon-3.0.lua:611>\n",
["session"] = 1747,
["counter"] = 6,
},
},
}
