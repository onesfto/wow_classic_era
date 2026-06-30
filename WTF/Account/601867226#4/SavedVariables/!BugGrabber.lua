
BugGrabberDB = {
["lastSanitation"] = 3,
["session"] = 1753,
["errors"] = {
{
["message"] = "[ADDON_ACTION_FORBIDDEN] 插件 'RXPGuides' 尝试调用保护功能 'TargetUnit()'。",
["time"] = 1782840420,
["locals"] = "self = <table> {\n}\nevent = \"ADDON_ACTION_FORBIDDEN\"\naddonName = \"RXPGuides\"\naddonFunc = \"TargetUnit()\"\nname = \"RXPGuides\"\nbadAddons = <table> {\n RXPGuides = true\n}\nL = <table> {\n NO_DISPLAY_2 = \"|cffffff00标准的错误显示插件名叫 BugSack，可以在找到 !BugGrabber 的网站上找到它。|r\"\n ERROR_DETECTED = \"%s |cffffff00已抓取，点击链接获取更多信息。|r\"\n BUGGRABBER_STOPPED = \"|cffffff00用户界面有太多的错误。所以，游戏体验会被降低。如不想再看到此信息请禁用或升级失效插件。|r\"\n USAGE = \"|cffffff00用法：/buggrabber <1-%d>。|r\"\n STOP_NAG = \"|cffffff00!BugGrabber 将不再提示缺失错误显示插件信息知道下个版本发布。|r\"\n NO_DISPLAY_STOP = \"|cffffff00如果你不希望再次被提醒，请输入 /stopnag。|r\"\n NO_DISPLAY_1 = \"|cffffff00似乎没有与 !BugGrabber 一起运行的错误显示插件。虽然斜线命令访问错误报告，但错误显示插件可以以更快捷的方式帮助您管理这些错误。|r\"\n ERROR_UNABLE = \"|cffffff00!BugGrabber 本身无法检索其他玩家的错误。请安装 BugSack 或类似的错误显示插件，可能会包含这些功能。|r\"\n ADDON_CALL_PROTECTED = \"[%s] 插件 '%s' 尝试调用保护功能 '%s'。\"\n}\n",
["stack"] = "[Interface/AddOns/!BugGrabber/BugGrabber.lua]:554: in function '?'\n[Interface/AddOns/!BugGrabber/BugGrabber.lua]:538: in function <Interface/AddOns/!BugGrabber/BugGrabber.lua:538>\n[C]: ?\n[Interface/AddOns/RXPGuides/Targeting.lua]:509: in function <Interface/AddOns/RXPGuides/Targeting.lua:486>\n[C]: ?\n[C]: ?\n",
["session"] = 1748,
["counter"] = 2,
},
{
["message"] = "Interface/AddOns/RXPGuides/Targeting.lua:558: attempt to index field 'text' (a nil value)",
["time"] = 1782840457,
["locals"] = "self = StaticPopup1 {\n RightEdge = Texture {\n }\n visibleButtons = <table> {\n }\n data = <table> {\n }\n TopEdge = Texture {\n }\n ButtonContainer = Frame {\n }\n LeftEdge = Texture {\n }\n SubText = FontString {\n }\n MoneyInputFrame = StaticPopup1MoneyInputFrame {\n }\n Spinner = Frame {\n }\n MoneyFrame = StaticPopup1MoneyFrame {\n }\n timeleft = 0\n Separator = Texture {\n }\n BG = Frame {\n }\n DarkOverlay = Frame {\n }\n ProgressBarFill = Texture {\n }\n TopSpacer = FontString {\n }\n CoverFrame = Frame {\n }\n PixelSnapDisabled = true\n AlertIcon = Texture {\n }\n ProgressBarBorder = Texture {\n }\n BottomRightCorner = Texture {\n }\n which = \"WEAKAURAS_CONFIRM_DELETE\"\n ItemFrame = Frame {\n }\n previousRegionKey = \"ButtonContainer\"\n template = \"Transparent\"\n BottomLeftCorner = Texture {\n }\n EditBox = StaticPopup1EditBox {\n }\n TopLeftCorner = Texture {\n }\n Dropdown = Button {\n }\n Center = Texture {\n }\n ProgressBarSpacer = Texture {\n }\n BottomEdge = Texture {\n }\n backdropInfo = <table> {\n }\n TopRightCorner = Texture {\n }\n numButtons = 2\n dialogInfo = <table> {\n }\n Text = StaticPopup1Text {\n }\n CloseButton = StaticPopup1CloseButton {\n }\n Buttons = <table> {\n }\n ExtraButton = StaticPopup1ExtraButton {\n }\n heightPadding = 16\n}\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field 'text' (a nil value)\"\nactionForbiddenText = \"RXPGuides已被禁用，因为该功能只对暴雪的UI开放。\n你可以禁用这个插件并重新装载UI。\"\n",
["stack"] = "[Interface/AddOns/RXPGuides/Targeting.lua]:558: in function <Interface/AddOns/RXPGuides/Targeting.lua:557>\n[C]: ?\n[C]: ?\n[C]: in function 'Show'\n[Interface/AddOns/Blizzard_StaticPopup/StaticPopup.lua]:390: in function <...nterface/AddOns/Blizzard_StaticPopup/StaticPopup.lua:277>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function 'StaticPopup_Show'\n[Interface/AddOns/WeakAurasOptions/WeakAurasOptions.lua]:490: in function 'ConfirmDelete'\n[Interface/AddOns/WeakAurasOptions/AceGUI-Widgets/AceGUIWidget-WeakAurasDisplayButton.lua]:622: in function 'func'\n[Interface/AddOns/PallyPower/Libs/LibUIDropDownMenu/LibUIDropDownMenu/LibUIDropDownMenu.lua]:233: in function <...DropDownMenu/LibUIDropDownMenu/LibUIDropDownMenu.lua:199>\n[Interface/AddOns/PallyPower/Libs/LibUIDropDownMenu/LibUIDropDownMenu/LibUIDropDownMenu.lua]:453: in function <...DropDownMenu/LibUIDropDownMenu/LibUIDropDownMenu.lua:452>\n",
["session"] = 1748,
["counter"] = 8,
},
{
["message"] = "[ADDON_ACTION_BLOCKED] 插件 '*** ForceTaint_Strong ***' 尝试调用保护功能 'UNKNOWN()'。",
["time"] = 1782842668,
["locals"] = "self = <table> {\n}\nevent = \"ADDON_ACTION_BLOCKED\"\naddonName = \"*** ForceTaint_Strong ***\"\naddonFunc = \"UNKNOWN()\"\nname = \"*** ForceTaint_Strong ***\"\nbadAddons = <table> {\n *** ForceTaint_Strong *** = true\n}\nL = <table> {\n NO_DISPLAY_2 = \"|cffffff00标准的错误显示插件名叫 BugSack，可以在找到 !BugGrabber 的网站上找到它。|r\"\n ERROR_DETECTED = \"%s |cffffff00已抓取，点击链接获取更多信息。|r\"\n BUGGRABBER_STOPPED = \"|cffffff00用户界面有太多的错误。所以，游戏体验会被降低。如不想再看到此信息请禁用或升级失效插件。|r\"\n USAGE = \"|cffffff00用法：/buggrabber <1-%d>。|r\"\n STOP_NAG = \"|cffffff00!BugGrabber 将不再提示缺失错误显示插件信息知道下个版本发布。|r\"\n NO_DISPLAY_STOP = \"|cffffff00如果你不希望再次被提醒，请输入 /stopnag。|r\"\n NO_DISPLAY_1 = \"|cffffff00似乎没有与 !BugGrabber 一起运行的错误显示插件。虽然斜线命令访问错误报告，但错误显示插件可以以更快捷的方式帮助您管理这些错误。|r\"\n ERROR_UNABLE = \"|cffffff00!BugGrabber 本身无法检索其他玩家的错误。请安装 BugSack 或类似的错误显示插件，可能会包含这些功能。|r\"\n ADDON_CALL_PROTECTED = \"[%s] 插件 '%s' 尝试调用保护功能 '%s'。\"\n}\n",
["stack"] = "[Interface/AddOns/!BugGrabber/BugGrabber.lua]:554: in function '?'\n[Interface/AddOns/!BugGrabber/BugGrabber.lua]:538: in function <Interface/AddOns/!BugGrabber/BugGrabber.lua:538>\n[C]: ?\n[C]: in function 'IsItemInRange'\n[return function()]:7: in function <[string \"return function()\"]:1>\n[C]: in function 'xpcall'\n[Interface/AddOns/WeakAuras/WeakAuras.lua]:5163: in function 'RunCustomTextFunc'\n[Interface/AddOns/WeakAuras/RegionTypes/Text.lua]:307: in function '?'\n[Interface/AddOns/WeakAuras/SubscribableObject.lua]:94: in function 'Notify'\n[Interface/AddOns/WeakAuras/RegionTypes/RegionPrototype.lua]:676: in function '?'\n[Interface/AddOns/WeakAuras/SubscribableObject.lua]:94: in function 'Notify'\n[Interface/AddOns/WeakAuras/RegionTypes/RegionPrototype.lua]:912: in function <...ace/AddOns/WeakAuras/RegionTypes/RegionPrototype.lua:910>\n",
["session"] = 1750,
["counter"] = 1,
},
{
["message"] = "[string \"return function() local chatFrame = SELECTE...\"]:16: attempt to index global 'ChatMenu' (a nil value)",
["time"] = 1782843257,
["locals"] = "self = 宏、文字表情Button {\n}\nbutton = \"LeftButton\"\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index global 'ChatMenu' (a nil value)\"\nregion = Frame {\n yOffset = 0\n anchorPoint = \"LEFT\"\n remaining = Infinite\n toShow = true\n PixelSnapDisabled = true\n scalex = 1\n regionType = \"texture\"\n relativePoint = \"LEFT\"\n texture = <table> {\n }\n color_b = 1\n scaley = 1\n alpha = 0.700000\n color_r = 1\n uid = \"TdfGN9Ez2HG\"\n duration = 0\n expirationTime = Infinite\n color_g = 1\n inverse = false\n paused = true\n subRegions = <table> {\n }\n height = 20\n startFormatters = <table> {\n }\n states = <table> {\n }\n progressType = \"timed\"\n xOffset = 0\n state = <table> {\n }\n xOffsetAnim = 0\n yOffsetAnim = 0\n color_a = 0\n values = <table> {\n }\n relativeTo = Frame {\n }\n id = \"宏、文字表情\"\n width = 20\n finishFormatters = <table> {\n }\n xOffsetRelative = 0\n yOffsetRelative = 0\n subRegionEvents = <table> {\n }\n cloneId = \"\"\n}\n",
["stack"] = "[return function() local chatFrame = SELECTED_DOCK_FRAME]:16: in function <[string \"return function() local chatFrame = SELECTE...\"]:14>\n",
["session"] = 1751,
["counter"] = 1,
},
},
}
