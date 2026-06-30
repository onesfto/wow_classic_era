
MacroToolkitDB = {
["char"] = {
["院长安娜 - 哈霍兰"] = {
["classFile"] = "PRIEST",
},
["瑟银零件 - 哈霍兰"] = {
["classFile"] = "ROGUE",
},
["津巴布韦公主 - 哈霍兰"] = {
["macros"] = {
[122] = {
["name"] = "吸片",
["icon"] = "136163",
["body"] = "#showtooltip 吸取灵魂\n/cast [@mouseover,exists,harm,nodead][] 吸取灵魂\n",
},
[126] = {
["name"] = "火雨",
["icon"] = "136186",
["body"] = "#showtooltip\n/cast [mod:shift]地狱烈焰;火焰之雨\n",
},
[132] = {
["name"] = "鲁莽",
["icon"] = "136225",
["body"] = "#showtooltip 鲁莽诅咒\n/cast [@mouseover,exists,harm,nodead][] 鲁莽诅咒\n",
},
[123] = {
["name"] = "吸血",
["icon"] = "136169",
["body"] = "#showtooltip [mod:ctrl] 吸取法力; [mod:shift] 生命通道; 吸取生命\n/cast [mod:ctrl] 吸取法力\n/cast [mod:shift,@pet] 生命通道\n/cast [@mouseover,exists,harm,nodead][] 吸取生命\n",
},
[127] = {
["name"] = "献祭",
["icon"] = "134400",
["body"] = "#showtooltip 献祭之油\n/use [combat] 献祭之油\n",
},
[124] = {
["name"] = "恐惧",
["icon"] = "136183",
["body"] = "#showtooltip [mod:shift] 恐惧嚎叫; 恐惧术\n/cast [mod:shift] 恐惧嚎叫\n/cast [@mouseover,exists,harm,nodead][] 恐惧术\n",
},
[128] = {
["name"] = "痛苦",
["icon"] = "136139",
["body"] = "#showtooltip [mod:shift] 诅咒增幅; 痛苦诅咒\n/cast [mod:shift] 诅咒增幅\n/cast [@mouseover,exists,harm,nodead][] 痛苦诅咒\n",
},
[121] = {
["name"] = "元素",
["icon"] = "136130",
["body"] = "#showtooltip 元素诅咒\n/cast [@mouseover,exists,harm,nodead][] 元素诅咒\n",
},
[129] = {
["name"] = "腐蚀",
["icon"] = "136118",
["body"] = "#showtooltip\n/cast [@mouseover,exists,harm,nodead][] 腐蚀术\n",
},
[125] = {
["name"] = "拉人",
["icon"] = "136223",
["body"] = "#showtooltip 召唤仪式\n/ra 召唤 %t\n/cast 召唤仪式\n",
},
[130] = {
["name"] = "蓝胖",
["icon"] = "136221",
["body"] = "#showtooltip [pet:虚空行者] 牺牲; 召唤虚空行者\n/cast [combat,pet:虚空行者] 牺牲\n/cast [combat,nopet][@pet,dead] 恶魔支配\n/cast 召唤虚空行者\n",
},
[131] = {
["name"] = "饰品",
["icon"] = "134501",
["body"] = "#showtooltip [mod:shift] 14; 13\n/use 13\n/use 14\n",
},
},
["classFile"] = "WARLOCK",
["backups"] = {
},
},
["魔女桑德兰 - 哈霍兰"] = {
["macros"] = {
[131] = {
["icon"] = "132218",
["name"] = "奥",
["body"] = "#showtooltip 奥术射击\n/cast [@mouseover,harm,nodead][] !自动射击\n/cast [@mouseover,harm,nodead][] 奥术射击\n",
},
[135] = {
["icon"] = "132089",
["name"] = "影遁",
["body"] = "#showtooltip 影遁\n/petpassive\n/petstay\n/cast [nostealth,combat] 假死\n/castsequence [nostealth] reset=20 晨露酒\n/castsequence [nostealth] 影遁\n",
},
[139] = {
["icon"] = "132204",
["name"] = "毒",
["body"] = "#showtooltip 毒蛇钉刺\n/cast [@mouseover,harm,nodead][] !自动射击\n/cast [@mouseover,harm,nodead][] 毒蛇钉刺\n/petattack [@mouseover,harm,nodead][harm]\n",
},
[143] = {
["icon"] = "132223",
["name"] = "砍",
["body"] = "# showtooltip 猛禽一击\n/castsequence reset=5 猛禽一击,摔绊,摔绊,摔绊,摔绊\n/castrandom 猫鼬撕咬,反击\n",
},
[122] = {
["icon"] = "132281",
["name"] = "VuhDoDCShieldNames",
["body"] = "N[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]法德迦[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]\n",
},
[124] = {
["icon"] = "135291",
["name"] = "双武器",
["body"] = "/equipslot 16 大元帅的长剑\n/equipslot 17 大元帅的迅捷之刃\n",
},
[126] = {
["icon"] = "136076",
["name"] = "啸",
["body"] = "#showtooltip\n/castsequence 雄鹰守护,猎豹守护\n",
},
[128] = {
["icon"] = "310730",
["name"] = "图腾",
["body"] = "/petattack\n/petattack [target=战栗图腾][target=图腾]\n/petattack [target=风怒图腾][target=图腾]\n/petattack [target=地缚图腾][target=图腾]\n/petattack [target=根基图腾][target=图腾]\n/petattack [target=灼热图腾][target=图腾]\n/petattack [target=法力之泉图腾][target=图腾]\n",
},
[132] = {
["icon"] = "132218",
["name"] = "奥",
["body"] = "#showtooltip 奥术射击\n/cast [@mouseover,harm,nodead][] !自动射击\n/cast [@mouseover,harm,nodead][] 奥术射击\n/petattack [@mouseover,harm,nodead][harm]\n",
},
[136] = {
["icon"] = "132208",
["name"] = "急速射击",
["body"] = "#showtooltip 急速射击\n/cast 急速射击\n/use 虫群卫士徽章\n/use 蜘蛛之吻\n/use 屠龙者的纹章\n",
},
[140] = {
["icon"] = "135813",
["name"] = "火",
["body"] = "#showtooltip [mod:shift] 爆炸陷阱; 献祭陷阱\n/cast [mod:shift] 爆炸陷阱\n/cast 献祭陷阱\n",
},
[144] = {
["icon"] = "132223",
["name"] = "砍",
["body"] = "#showtooltip\n/startattack\n/equipslot [mod:shift] 16 堕落的灰烬使者\n/castsequence reset=5 猛禽一击,摔绊,摔绊,摔绊,摔绊\n/castrandom 猫鼬撕咬,反击\n",
},
[148] = {
["icon"] = "135840",
["name"] = "霜",
["body"] = "#showtooltip 冰霜陷阱\n/cleartarget\n/petpassive\n/petfollow\n/cast [combat] 假死\n/cast 冰霜陷阱\n/targetlasttarget\n",
},
[129] = {
["icon"] = "132330",
["name"] = "多重",
["body"] = "#showtooltip [mod:shift] 扰乱射击; 多重射击\n/cast !自动射击\n/cast [mod:shift] 扰乱射击\n/cast 多重射击\n",
},
[133] = {
["icon"] = "136076",
["name"] = "守护",
["body"] = "#showtooltip [mod:alt] 豹群守护; [mod:shift] 猎豹守护; 雄鹰守护\n/cast [mod:alt] 豹群守护\n/cast [mod:shift] 猎豹守护\n/cast 雄鹰守护\n",
},
[137] = {
["icon"] = "135815",
["name"] = "标",
["body"] = "/cast [harm] 猎人印记;照明弹\n",
},
[141] = {
["icon"] = "132179",
["name"] = "狗",
["body"] = "#showtooltip\n/cast [mod:alt] 复活宠物\n/cast [mod:shiftl] 召唤宠物\n/cast [mod:ctrl] 解散野兽\n/cast 治疗宠物\n",
},
[121] = {
["icon"] = "132281",
["name"] = "VuhDoDCShieldData",
["body"] = "P[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]1MR[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]\n",
},
[123] = {
["icon"] = "135834",
["name"] = "冻",
["body"] = "#showtooltip 冰冻陷阱\n/cleartarget\n/petpassive\n/petfollow\n/cast [combat] 假死\n/cast 冰冻陷阱\n/targetlasttarget\n",
},
[125] = {
["icon"] = "134400",
["name"] = "吃喝",
["body"] = "#showtooltip item:34062\n/console Sound_EnableSFX 0\n/use 奥特兰克魔法点心\n/cast 影遁(种族特长)\n/console Sound_EnableSFX 1\n/script UIErrorsFrame:Clear()\n",
},
[127] = {
["icon"] = "132089",
["name"] = "喝水",
["body"] = "/castsequence [nostealth] reset=20 魔法晶水\n/cast 影遁(种族特长)\n",
},
[130] = {
["icon"] = "132330",
["name"] = "多重",
["body"] = "#showtooltip 多重射击\n/cast !自动射击\n/cast 多重射击\n",
},
[134] = {
["icon"] = "135541",
["name"] = "射",
["body"] = "#showtooltip 18\n/startattack\n/cast !自动射击\n",
},
[138] = {
["icon"] = "132204",
["name"] = "毒",
["body"] = "#showtooltip 毒蛇钉刺\n/cast [@mouseover,harm,nodead][] !自动射击\n/cast [@mouseover,harm,nodead][] 毒蛇钉刺\n",
},
[142] = {
["icon"] = "135130",
["name"] = "瞄准",
["body"] = "#showtooltip [mod:shift] 宁神射击; 瞄准射击\n/cast !自动射击\n/cast [mod:shift] 宁神射击\n/cast 瞄准射击\n",
},
[146] = {
["icon"] = "132204",
["name"] = "钉刺",
["body"] = "#showtooltip [mod:shift] 蝰蛇钉刺; [mod:alt] 毒蝎钉刺; 毒蛇钉刺\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 蝰蛇钉刺\n/cast [mod:alt,@mouseover,harm,nodead][mod:alt,harm,nodead] 毒蝎钉刺\n/cast [@mouseover,harm,nodead][harm,nodead] 毒蛇钉刺\n",
},
[150] = {
["icon"] = "132172",
["name"] = "鹰",
["body"] = "# showtooltip 鹰眼术\n/cast !鹰眼术\n",
},
[149] = {
["icon"] = "132153",
["name"] = "驱散",
["body"] = "#showtooltip [mod:shift] 震荡射击; 驱散射击\n/stopcasting\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 震荡射击\n/cast [@mouseover,harm,nodead][harm,nodead] 驱散射击\n",
},
[147] = {
["icon"] = "135860",
["name"] = "震荡",
["body"] = "#showtooltip 震荡射击\n/stopcasting\n/cast [@mouseover,harm,nodead][harm,nodead] 震荡射击\n",
},
[145] = {
["icon"] = "132150",
["name"] = "野兽",
["body"] = "#showtooltip [mod:shift] 恐吓野兽; 野兽之眼\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 恐吓野兽\n/cast 野兽之眼\n",
},
},
["classFile"] = "HUNTER",
["backups"] = {
{
["m"] = {
{
["index"] = 121,
["name"] = "冻",
["icon"] = 135834,
["body"] = "#showtooltip 冰冻陷阱\n/cleartarget\n/petpassive\n/petfollow\n/cast [combat] 假死\n/cast 冰冻陷阱\n/targetlasttarget\n",
},
{
["index"] = 122,
["name"] = "双武器",
["icon"] = 135291,
["body"] = "/equipslot 16 大元帅的长剑\n/equipslot 17 大元帅的迅捷之刃\n",
},
{
["index"] = 123,
["name"] = "图腾",
["icon"] = 310730,
["body"] = "/petattack\n/petattack [target=战栗图腾][target=图腾]\n/petattack [target=风怒图腾][target=图腾]\n/petattack [target=地缚图腾][target=图腾]\n/petattack [target=根基图腾][target=图腾]\n/petattack [target=灼热图腾][target=图腾]\n/petattack [target=法力之泉图腾][target=图腾]\n",
},
{
["index"] = 124,
["name"] = "多重",
["icon"] = 132330,
["body"] = "#showtooltip [mod:shift] 扰乱射击; 多重射击\n/cast !自动射击\n/cast [mod:shift] 扰乱射击\n/cast 多重射击\n",
},
{
["index"] = 125,
["name"] = "奥",
["icon"] = 132218,
["body"] = "#showtooltip 奥术射击\n/cast [@mouseover,harm,nodead][] !自动射击\n/cast [@mouseover,harm,nodead][] 奥术射击\n",
},
{
["index"] = 126,
["name"] = "守护",
["icon"] = 136076,
["body"] = "#showtooltip [mod:alt] 豹群守护; [mod:shift] 猎豹守护; 雄鹰守护\n/cast [mod:alt] 豹群守护\n/cast [mod:shift] 猎豹守护\n/cast 雄鹰守护\n",
},
{
["index"] = 127,
["name"] = "射",
["icon"] = 135541,
["body"] = "#showtooltip 18\n/startattack\n/cast !自动射击\n",
},
{
["index"] = 128,
["name"] = "影遁",
["icon"] = 132089,
["body"] = "#showtooltip 影遁\n/petpassive\n/petstay\n/cast [nostealth,combat] 假死\n/castsequence [nostealth] reset=20 晨露酒\n/castsequence [nostealth] 影遁\n",
},
{
["index"] = 129,
["name"] = "标",
["icon"] = 135815,
["body"] = "/cast [harm] 猎人印记;照明弹\n",
},
{
["index"] = 130,
["name"] = "火",
["icon"] = 135813,
["body"] = "#showtooltip [mod:shift] 爆炸陷阱; 献祭陷阱\n/cast [mod:shift] 爆炸陷阱\n/cast 献祭陷阱\n",
},
{
["index"] = 131,
["name"] = "狗",
["icon"] = 132179,
["body"] = "#showtooltip\n/cast [mod:alt] 复活宠物\n/cast [mod:shiftl] 召唤宠物\n/cast [mod:ctrl] 解散野兽\n/cast 治疗宠物\n",
},
{
["index"] = 132,
["name"] = "瞄准",
["icon"] = 135130,
["body"] = "#showtooltip [mod:shift] 宁神射击; 瞄准射击\n/cast !自动射击\n/cast [mod:shift] 宁神射击\n/cast 瞄准射击\n",
},
{
["index"] = 133,
["name"] = "砍",
["icon"] = 132223,
["body"] = "#showtooltip\n/startattack\n/equipslot [mod:shift] 16 堕落的灰烬使者\n/castsequence reset=5 猛禽一击,摔绊,摔绊,摔绊,摔绊\n/castrandom 猫鼬撕咬,反击\n",
},
{
["index"] = 134,
["name"] = "野兽",
["icon"] = 132150,
["body"] = "#showtooltip [mod:shift] 恐吓野兽; 野兽之眼\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 恐吓野兽\n/cast 野兽之眼\n",
},
{
["index"] = 135,
["name"] = "钉刺",
["icon"] = 132204,
["body"] = "#showtooltip [mod:shift] 蝰蛇钉刺; [mod:alt] 毒蝎钉刺; 毒蛇钉刺\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 蝰蛇钉刺\n/cast [mod:alt,@mouseover,harm,nodead][mod:alt,harm,nodead] 毒蝎钉刺\n/cast [@mouseover,harm,nodead][harm,nodead] 毒蛇钉刺\n",
},
{
["index"] = 136,
["name"] = "震荡",
["icon"] = 135860,
["body"] = "#showtooltip 震荡射击\n/stopcasting\n/cast [@mouseover,harm,nodead][harm,nodead] 震荡射击\n",
},
{
["index"] = 137,
["name"] = "霜",
["icon"] = 135840,
["body"] = "#showtooltip 冰霜陷阱\n/cleartarget\n/petpassive\n/petfollow\n/cast [combat] 假死\n/cast 冰霜陷阱\n/targetlasttarget\n",
},
{
["index"] = 138,
["name"] = "驱散",
["icon"] = 132153,
["body"] = "#showtooltip [mod:shift] 震荡射击; 驱散射击\n/stopcasting\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 震荡射击\n/cast [@mouseover,harm,nodead][harm,nodead] 驱散射击\n",
},
{
["index"] = 139,
["name"] = "鹰",
["icon"] = 132172,
["body"] = "# showtooltip 鹰眼术\n/cast !鹰眼术\n",
},
},
["d"] = "26/01/11 09:29:04",
["n"] = "猎人",
},
},
["lastbackup"] = "26/01/11 09:29:04",
},
["巨龙守护者 - 哈霍兰"] = {
["macros"] = {
[131] = {
["name"] = "断筋",
["icon"] = "132316",
["body"] = "#showtooltips 断筋\n/cast 断筋\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n/cancelaura 银色黎明委任徽章\n",
},
[135] = {
["name"] = "狂怒",
["icon"] = "136009",
["body"] = "#showtooltip 狂暴之怒\n/cast [nostance:3] 狂暴姿态\n/cast 狂暴之怒\n/startattack\n",
},
[139] = {
["name"] = "缴",
["icon"] = "132343",
["body"] = "#showtooltip 缴械\n/cast [nostance:2] 防御姿态\n/cast 缴械\n/cancelaura 缴械\n/startattack\n",
},
[143] = {
["name"] = "英",
["icon"] = "132282",
["body"] = "#showtooltip 英勇打击\n/cast [nostance:3] 狂暴姿态\n/cast 英勇打击\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 灵感\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n/cancelaura 银色黎明委任徽章\n",
},
[122] = {
["name"] = "勇",
["icon"] = "132282",
["body"] = "#showtooltip 英勇打击\n/cast [nostance:2] 防御姿态\n/cast 英勇打击\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 灵感\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n/cancelaura 银色黎明委任徽章\n",
},
[124] = {
["name"] = "双快",
["icon"] = "135372",
["body"] = "#showtooltip 饥饿之寒\n/equipslot 16 饥饿之寒\n/equipslot 17 伊普利斯，堕落炽天使之刃 \n",
},
[126] = {
["name"] = "嗜",
["icon"] = "136012",
["body"] = "#showtooltip 嗜血\n/cast [nostance:3] 狂暴姿态\n/cast 嗜血\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n/cancelaura 银色黎明委任徽章\n",
},
[128] = {
["name"] = "拦",
["icon"] = "132307",
["body"] = "#showtooltip 拦截\n/cast [nostance:3] 狂暴姿态\n/cast [@mouseover,harm,nodead][] 拦截\n",
},
[132] = {
["name"] = "旋",
["icon"] = "132369",
["body"] = "#showtooltips 旋风斩\n/cast [nostance:3] 狂暴姿态\n/cast 旋风斩\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n/cancelaura 银色黎明委任徽章\n",
},
[136] = {
["name"] = "盾击",
["icon"] = "132357",
["body"] = "#showtooltip 盾击\n/equip 大元帅的庇护之盾\n/cast 盾击\n/startattack\n",
},
[140] = {
["name"] = "群",
["icon"] = "132369",
["body"] = "#showtooltip 嗜血(等级 4)\n/startattack\n/castsequence reset=4 嗜血(等级 4),旋风斩,嗜血(等级 4)\n/cast 顺劈斩(等级 5)\n",
},
[144] = {
["name"] = "血",
["icon"] = "136012",
["body"] = "#showtooltip 嗜血\n/cast [nostance:2] 防御姿态\n/cast 嗜血\n/cancelaura 嗜血\n/startattack\n",
},
[148] = {
["name"] = "顺",
["icon"] = "132338",
["body"] = "#showtooltips 顺劈斩\n/cast [nostance:3] 狂暴姿态\n/cast 顺劈斩\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n/cancelaura 银色黎明委任徽章\n",
},
[129] = {
["name"] = "拳",
["icon"] = "132938",
["body"] = "#showtooltip 拳击\n/cast [nostance:3] 狂暴姿态\n/cast [@mouseover,harm,nodead][] 拳击\n",
},
[133] = {
["name"] = "杀",
["icon"] = "134400",
["body"] = "",
},
[137] = {
["name"] = "盾墙",
["icon"] = "132362",
["body"] = "#showtooltip 盾墙\n/equipslot 16 饥饿之寒\n/equip 大元帅的庇护之盾\n/cast [nostance:2]防御姿态;[stance:2]盾墙\n",
},
[141] = {
["name"] = "群嘲",
["icon"] = "132091",
["body"] = "#showtooltip 挑战怒吼\n/cast [nostance:2] 防御姿态\n/cast 挑战怒吼\n",
},
[121] = {
["name"] = "冲",
["icon"] = "132337",
["body"] = "#showtooltip 冲锋\n/cast [nocombat,nostance:1] 战斗姿态\n/cast [nocombat,@mouseover,harm,nodead][] 冲锋\n",
},
[123] = {
["name"] = "单体",
["icon"] = "136012",
["body"] = "#showtooltip 嗜血(等级 4)\n/startattack\n/castsequence reset=4 嗜血(等级 4),旋风斩,嗜血(等级 4)\n/cast 英勇打击(等级 9)\n",
},
[125] = {
["name"] = "双锤",
["icon"] = "134400",
["body"] = "#showtooltip 苍穹击碎者\n/equipslot 16 苍穹击碎者\n/equipslot 17 阿努比萨斯战锤 \n",
},
[127] = {
["name"] = "嘲",
["icon"] = "132340",
["body"] = "#showtooltip [mod]挑战怒吼;[stance:1]惩戒痛击;[stance:2]嘲讽;[stance:3]猛击\n/startattack\n/施放 [mod:shift] 挑战怒吼\n/施放 [nomod,stance:1]惩戒痛击;[nomod,stance:2]嘲讽;[nomod,stance:3]猛击\n",
},
[130] = {
["name"] = "斩",
["icon"] = "135358",
["body"] = "#showtooltip 斩杀\n/equipslot 16 饥饿之寒\n/equipslot 17 伊普利斯，堕落炽天使之刃\n/cast [nostance:3] 狂暴姿态\n/cast 斩杀\n/startattack\n/cancelaura 奥术光辉\n/cancelaura 精神祷言\n/cancelaura 强效治疗术\n/cancelaura 愈合\n/cancelaura 回春术\n/cancelaura 嗜血\n/cancelaura 神圣之力\n/cancelaura 信仰\n/cancelaura 利爪祝福\n",
},
[134] = {
["name"] = "死愿",
["icon"] = "136146",
["body"] = "#showtooltip 死亡之愿\n/startattack\n/cast 死亡之愿\n",
},
[138] = {
["name"] = "破甲",
["icon"] = "132363",
["body"] = "#showtooltip 破甲攻击\n/cast 破甲攻击(等级 5)\n/startattack\n",
},
[142] = {
["name"] = "致密炸弹",
["icon"] = "134400",
["body"] = "#showtooltip 致密炸弹\n/use [@player] 致密炸弹\n",
},
[146] = {
["name"] = "远程",
["icon"] = "132222",
["body"] = "#showtooltip\n/startattack\n/cast 枪械射击\n/cast 弩射击\n/cast 弓射击\n/cast 投掷\n",
},
[150] = {
["name"] = "饰",
["icon"] = "133870",
["body"] = "#showtooltip 13\n",
},
[145] = {
["name"] = "血性",
["icon"] = "132277",
["body"] = "#showtooltip 血性狂暴\n/startattack\n/cast 血性狂暴\n",
},
[147] = {
["name"] = "雷霆",
["icon"] = "136105",
["body"] = "#showtooltip 雷霆一击\n/施放 战斗姿态\n/施放 雷霆一击\n",
},
[149] = {
["name"] = "饰",
["icon"] = "136146",
["body"] = "#showtooltip 死亡之愿\n/施放 死亡之愿\n/施放 蜘蛛之吻\n/施放 屠龙者的纹章\n/施放 沙漠掠夺者塑像\n/施放 虫群卫士徽章\n",
},
},
["classFile"] = "WARRIOR",
},
["寒脊山小郡主 - 法琳娜"] = {
["classFile"] = "MAGE",
},
["青铜龙守护者 - 哈霍兰"] = {
["macros"] = {
[121] = {
["icon"] = "132281",
["name"] = "VuhDoDCShieldData",
["body"] = "P[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]1MR[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]\n",
},
[122] = {
["icon"] = "132281",
["name"] = "VuhDoDCShieldNames",
["body"] = "N[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]青铜龙[x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x][x]\n",
},
},
["classFile"] = "MAGE",
},
["艾尔文小公主 - 法琳娜"] = {
["classFile"] = "ROGUE",
},
["护士长玛利亚 - 哈霍兰"] = {
["classFile"] = "DRUID",
["lastbackup"] = "26/01/10 11:34:52",
["macros"] = {
[131] = {
["icon"] = "136048",
["name"] = "激活",
["body"] = "#showtooltip 激活\n/cast [mod:alt, @player] 激活; [@target, exists] 激活\n",
},
[135] = {
["icon"] = "134400",
["name"] = "触11",
["body"] = "#showtooltip 治疗之触(等级 11)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 11)\n#/RA 》》%t《《 正在接受 第 11 棒 的超级治疗\n",
},
[139] = {
["icon"] = "134400",
["name"] = "触7",
["body"] = "#showtooltip 治疗之触(等级 7)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 7)\n",
},
[122] = {
["icon"] = "135952",
["name"] = "咒",
["body"] = "#showtooltip [mod:shift] 分解; 解除诅咒\n/cast [mod:shift] 分解\n/cast [mod:alt,@player][@mouseover,help,nodead][help][@targettarget,help,nodead] 解除诅咒\n",
},
[124] = {
["icon"] = "136033",
["name"] = "弱",
["body"] = "#showtooltip [mod:shift] 虫群; [nostance] 精灵之火; [stance] 精灵之火（野性）\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 虫群\n/cast [nomod,nostance,@mouseover,harm,nodead][nomod,nostance,harm,nodead] 精灵之火\n/cast [nomod,stance,@mouseover,harm,nodead][n\n",
},
[126] = {
["icon"] = "134400",
["name"] = "愈4",
["body"] = "#showtooltip 愈合(等级 4)\n/cancelaura 树皮术\n/use [combat] 休眠水晶\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  愈合(等级 4)\n",
},
[128] = {
["icon"] = "136085",
["name"] = "愈9",
["body"] = "#showtooltip 愈合\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  愈合(等级 9)\n",
},
[132] = {
["icon"] = "134400",
["name"] = "炉石",
["body"] = "#showtooltip\n/cast [mod:shift] 传送：月光林地; 炉石\n",
},
[136] = {
["icon"] = "134400",
["name"] = "触2",
["body"] = "#showtooltip 治疗之触(等级 2)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 2)\n",
},
[140] = {
["icon"] = "132089",
["name"] = "隐",
["body"] = "#showtooltip 影遁\n/cancelform [noform:5]\n/施放 影遁\n",
},
[129] = {
["icon"] = "136081",
["name"] = "春",
["body"] = "#showtooltip 回春术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  回春术\n",
},
[133] = {
["icon"] = "136100",
["name"] = "缠",
["body"] = "#showtooltip [mod:shift] 自然之握; 纠缠根须\n/cast [mod:shift] 自然之握\n/cast [@mouseover,harm,nodead][harm,nodead] 纠缠根须\n",
},
[137] = {
["icon"] = "134400",
["name"] = "触3",
["body"] = "#showtooltip 治疗之触(等级 3)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] [] 治疗之触(等级 3)\n",
},
[121] = {
["icon"] = "134400",
["name"] = "GO！",
["body"] = "#showtooltip 黑色战豹缰绳\n/use [nocombat] 黑色战豹缰绳\n/cast [swimming] 水栖形态\n/cast [combat] 猎豹形态\n",
},
[123] = {
["icon"] = "136033",
["name"] = "弱",
["body"] = "#showtooltip [mod:shift] 虫群; 精灵之火\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 虫群\n/cast [stance:1/2,@mouseover,harm,nodead][stance:1/2,harm,nodead] 精灵之火（野性）\n/cast [nostance,@mouseover,harm,nodead][nostance,harm,nodead] 精灵之火\n",
},
[125] = {
["icon"] = "134400",
["name"] = "愈0",
["body"] = "#showtooltip 愈合(等级 9)\n/cancelaura 树皮术\n/cast 自然迅捷\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] 愈合(等级 9)\n",
},
[127] = {
["icon"] = "134400",
["name"] = "愈5",
["body"] = "#showtooltip 愈合(等级 5)\n/cancelaura 树皮术\n/use [combat] 休眠水晶\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  愈合(等级 5)\n",
},
[130] = {
["icon"] = "136068",
["name"] = "毒",
["body"] = "#showtooltip [mod:shift] 休眠; 驱毒术\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 休眠\n/cast [mod:alt,@player][@mouseover,help,nodead][help][@targettarget,help,nodead][] 驱毒术\n",
},
[134] = {
["icon"] = "136041",
["name"] = "触0",
["body"] = "#showtooltip 治疗之触\n/cancelaura 树皮术\n/cast 自然迅捷\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 11)\n",
},
[138] = {
["icon"] = "134400",
["name"] = "触4",
["body"] = "#showtooltip 治疗之触(等级 4)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] [] 治疗之触(等级 4)\n",
},
},
["backups"] = {
{
["m"] = {
{
["index"] = 121,
["name"] = "GO！",
["icon"] = 132225,
["body"] = "#showtooltip 黑色战豹缰绳\n/use [nocombat] 黑色战豹缰绳\n/cast [swimming] 水栖形态\n/cast [combat] 猎豹形态\n",
},
{
["index"] = 122,
["name"] = "咒",
["icon"] = 135952,
["body"] = "#showtooltip [mod:shift] 分解; 解除诅咒\n/cast [mod:shift] 分解\n/cast [mod:alt,@player][@mouseover,help,nodead][help][@targettarget,help,nodead] 解除诅咒\n",
},
{
["index"] = 123,
["name"] = "弱",
["icon"] = 136033,
["body"] = "#showtooltip [mod:shift] 虫群; 精灵之火\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 虫群\n/cast [stance:1/2,@mouseover,harm,nodead][stance:1/2,harm,nodead] 精灵之火（野性）\n/cast [nostance,@mouseover,harm,nodead][nostance,harm,nodead] 精灵之火\n",
},
{
["index"] = 124,
["name"] = "愈0",
["icon"] = 136085,
["body"] = "#showtooltip 愈合(等级 9)\n/cancelform [noform:5, harm]\n/cast 自然迅捷\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  愈合(等级 9)\n",
},
{
["index"] = 125,
["name"] = "愈5",
["icon"] = 136085,
["body"] = "#showtooltip 愈合(等级 5)\n/cancelaura 树皮术\n/use [combat] 休眠水晶\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  愈合(等级 5)\n",
},
{
["index"] = 126,
["name"] = "愈9",
["icon"] = 136085,
["body"] = "#showtooltip 愈合\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  愈合(等级 9)\n",
},
{
["index"] = 127,
["name"] = "春",
["icon"] = 136081,
["body"] = "#showtooltip 回春术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  回春术\n",
},
{
["index"] = 128,
["name"] = "毒",
["icon"] = 136068,
["body"] = "#showtooltip [mod:shift] 休眠; 驱毒术\n/cast [mod:shift,@mouseover,harm,nodead][mod:shift,harm,nodead] 休眠\n/cast [mod:alt,@player][@mouseover,help,nodead][help][@targettarget,help,nodead][] 驱毒术\n",
},
{
["index"] = 129,
["name"] = "缠",
["icon"] = 136100,
["body"] = "#showtooltip [mod:shift] 自然之握; 纠缠根须\n/cast [mod:shift] 自然之握\n/cast [@mouseover,harm,nodead][harm,nodead] 纠缠根须\n",
},
{
["index"] = 130,
["name"] = "缠绕",
["icon"] = 136100,
["body"] = "#showtooltip  纠缠根须\n/cast [@mouseover,harm,nodead][harm,nodead] 纠缠根须\n",
},
{
["index"] = 131,
["name"] = "触0",
["icon"] = 136041,
["body"] = "#showtooltip 治疗之触\n/cast 自然迅捷\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 11)\n",
},
{
["index"] = 132,
["name"] = "触11",
["icon"] = 136041,
["body"] = "#showtooltip 治疗之触(等级 11)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 11)\n#/RA 》》%t《《 正在接受 第 11 棒 的超级治疗\n",
},
{
["index"] = 133,
["name"] = "触2",
["icon"] = 136041,
["body"] = "#showtooltip 治疗之触(等级 2)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 2)\n",
},
{
["index"] = 134,
["name"] = "触3",
["icon"] = 136041,
["body"] = "#showtooltip 治疗之触(等级 3)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] [] 治疗之触(等级 3)\n",
},
{
["index"] = 135,
["name"] = "触4",
["icon"] = 136041,
["body"] = "#showtooltip 治疗之触(等级 4)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] [] 治疗之触(等级 4)\n",
},
{
["index"] = 136,
["name"] = "触7",
["icon"] = 136041,
["body"] = "#showtooltip 治疗之触(等级 7)\n/cancelaura 树皮术\n/cast [mod:alt,@player] [@mouseover,help,nodead] [help] [@targettarget,help,nodead] []  治疗之触(等级 7)\n",
},
{
["index"] = 137,
["name"] = "隐",
["icon"] = 132089,
["body"] = "#showtooltip 影遁\n/cancelform [noform:5]\n/施放 影遁\n",
},
},
["d"] = "26/01/10 11:34:52",
["n"] = "德鲁伊",
},
},
},
["红龙守护者 - 哈霍兰"] = {
["classFile"] = "PALADIN",
},
},
["profileKeys"] = {
["院长安娜 - 哈霍兰"] = "profile",
["瑟银零件 - 哈霍兰"] = "profile",
["津巴布韦公主 - 哈霍兰"] = "profile",
["魔女桑德兰 - 哈霍兰"] = "profile",
["巨龙守护者 - 哈霍兰"] = "profile",
["寒脊山小郡主 - 法琳娜"] = "profile",
["青铜龙守护者 - 哈霍兰"] = "profile",
["艾尔文小公主 - 法琳娜"] = "profile",
["护士长玛利亚 - 哈霍兰"] = "profile",
["红龙守护者 - 哈霍兰"] = "profile",
},
["global"] = {
["ebackups"] = {
},
["lastbackup"] = "26/01/11 09:28:50",
["backups"] = {
{
["m"] = {
{
["index"] = 1,
["name"] = "Decursive",
["icon"] = 134400,
["body"] = "/script DecursiveRootTable.Dcr:Println('没有相关技能')\n",
},
{
["index"] = 2,
["name"] = "TMW",
["icon"] = 4638724,
["body"] = "/TMW\n",
},
{
["index"] = 3,
["name"] = "YY",
["icon"] = 4777763,
["body"] = "/RA YY：881411，下跳对应频道^_^\n",
},
{
["index"] = 4,
["name"] = "假人",
["icon"] = 132762,
["body"] = "#showtooltip 高级活动假人\n/use [combat,@player] 高级活动假人\n",
},
{
["index"] = 5,
["name"] = "无敌",
["icon"] = 134842,
["body"] = "#showtooltip 有限无敌药水\n/use [combat] 有限无敌药水\n",
},
{
["index"] = 6,
["name"] = "标记",
["icon"] = 252269,
["body"] = "/run local r,u,t,m,a,T=SMRI,UnitHealth,\"target\",\"mouseover\",{8,7,6,5,4,3,0}if not r or IsControlKeyDown()then r=1 end if 0~=u(m)then T=m elseif 0~=u(t)then T=t end if T then if GetRaidTargetIndex(T)~=a[r]then SetRaidTarget(T,a[r])end r=r%#a+1 end SMRI=r\n",
},
{
["index"] = 7,
["name"] = "炸",
["icon"] = 134400,
["body"] = "#showtooltip\n/use [combat] 地精工兵炸药\n/use [combat,@player] 致密炸弹\n",
},
{
["index"] = 8,
["name"] = "饰一",
["icon"] = 134010,
["body"] = "#showtooltip 13\n/use 13\n",
},
{
["index"] = 9,
["name"] = "饰二",
["icon"] = 135441,
["body"] = "#showtooltip 14\n/use 14\n",
},
},
["d"] = "26/01/11 09:28:50",
["n"] = "综合",
},
},
},
["profiles"] = {
["profile"] = {
["y"] = 378.8559875488281,
["x"] = 435.1380920410156,
["height"] = 423.9999084472656,
["width"] = 637.9998779296875,
},
},
}
