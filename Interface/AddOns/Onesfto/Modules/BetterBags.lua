local AceAddon = LibStub and LibStub('AceAddon-3.0', true)
if not AceAddon then return end

local Custom_CSV_Items = {
        [0] = "B-附魔",
        [744] = "首饰-特殊",
        [774] = "B-宝石",
        [783] = "B-皮",
        [811] = "武器-单手",
        [818] = "B-宝石",
        [871] = "武器-单手",
        [942] = "首饰-物理",
        [943] = "武器-双手",
        [1191] = "A-功能",
        [1206] = "B-宝石",
        [1210] = "B-宝石",
        [1529] = "B-宝石",
        [1705] = "B-宝石",
        [1710] = "A-红蓝",
        [1973] = "首饰-特殊",
        [2246] = "首饰-物理",
        [2318] = "B-皮",
        [2319] = "B-皮",
        [2447] = "B-草",
        [2449] = "B-草",
        [2450] = "B-草",
        [2452] = "B-草",
        [2453] = "B-草",
        [2459] = "A-功能",
        [2589] = "B-布",
        [2592] = "B-布",
        [2770] = "B-矿",
        [2771] = "B-矿",
        [2772] = "B-矿",
        [2775] = "B-矿",
        [2776] = "B-矿",
        [2802] = "首饰-抗性",
        [2820] = "首饰-特殊",
        [2835] = "B-矿",
        [2836] = "B-矿",
        [2838] = "B-矿",
        [2840] = "B-矿",
        [2841] = "B-矿",
        [2842] = "B-矿",
        [2901] = "工具",
        [2996] = "B-布",
        [3182] = "B-布",
        [3355] = "B-草",
        [3356] = "B-草",
        [3357] = "B-草",
        [3358] = "B-草",
        [3369] = "B-草",
        [3386] = "A-属性",
        [3387] = "A-功能",
        [3575] = "B-矿",
        [3576] = "B-矿",
        [3577] = "B-矿",
        [3818] = "B-草",
        [3819] = "B-草",
        [3820] = "B-草",
        [3821] = "B-草",
        [3823] = "A-功能",
        [3824] = "A-涂剂",
        [3825] = "A-属性",
        [3828] = "A-属性",
        [3829] = "A-涂剂",
        [3858] = "B-矿",
        [3859] = "B-矿",
        [3860] = "B-矿",
        [3864] = "B-宝石",
        [3928] = "A-红蓝",
        [4231] = "B-皮",
        [4232] = "B-皮",
        [4233] = "B-皮",
        [4234] = "B-皮",
        [4235] = "B-皮",
        [4236] = "B-皮",
        [4304] = "B-皮",
        [4305] = "B-布",
        [4306] = "B-布",
        [4337] = "B-布",
        [4338] = "B-布",
        [4339] = "B-布",
        [4357] = "A-BOOM",
        [4358] = "A-BOOM",
        [4365] = "A-BOOM",
        [4366] = "A-BOOM",
        [4370] = "A-BOOM",
        [4374] = "A-BOOM",
        [4377] = "A-BOOM",
        [4380] = "A-BOOM",
        [4384] = "A-BOOM",
        [4390] = "A-BOOM",
        [4394] = "A-BOOM",
        [4397] = "首饰-特殊",
        [4623] = "A-功能",
        [4625] = "B-草",
        [5462] = "坐骑宠物玩具",
        [5498] = "B-宝石",
        [5500] = "B-宝石",
        [5513] = "A-红蓝",
        [5631] = "A-功能",
        [5633] = "A-功能",
        [5634] = "A-功能",
        [5951] = "A-功能",
        [5956] = "工具",
        [5996] = "A-属性",
        [6037] = "B-矿",
        [6048] = "A-属性",
        [6049] = "A-属性",
        [6050] = "A-属性",
        [6051] = "A-属性",
        [6052] = "A-属性",
        [6149] = "A-红蓝",
        [6219] = "工具",
        [6291] = "B-鱼",
        [6303] = "B-鱼",
        [6308] = "B-鱼",
        [6317] = "B-鱼",
        [6358] = "B-鱼",
        [6361] = "B-鱼",
        [6362] = "B-鱼",
        [6372] = "A-功能",
        [6373] = "A-AP",
        [6522] = "B-鱼",
        [6657] = "A-功能",
        [6662] = "A-功能",
        [6948] = "工具",
        [7005] = "工具",
        [7067] = "B-矿",
        [7732] = "A-BOOM",
        [7909] = "B-宝石",
        [7910] = "B-宝石",
        [7911] = "B-矿",
        [7912] = "B-矿",
        [7971] = "B-宝石",
        [8007] = "A-红蓝",
        [8008] = "A-红蓝",
        [8076] = "A-吃喝",
        [8079] = "A-吃喝",
        [8146] = "A-BOOM",
        [8150] = "B-皮",
        [8151] = "A-BOOM",
        [8167] = "B-皮",
        [8169] = "B-皮",
        [8170] = "B-皮",
        [8171] = "B-皮",
        [8172] = "B-皮",
        [8365] = "B-鱼",
        [8366] = "B-鱼",
        [8410] = "A-非专业",
        [8411] = "A-非专业",
        [8412] = "A-非专业",
        [8423] = "A-非专业",
        [8424] = "A-非专业",
        [8529] = "A-功能",
        [8827] = "A-功能",
        [8831] = "B-草",
        [8836] = "B-草",
        [8838] = "B-草",
        [8839] = "B-草",
        [8845] = "B-草",
        [8846] = "B-草",
        [8932] = "A-吃喝",
        [8956] = "A-功能",
        [8957] = "B-鱼",
        [8959] = "B-鱼",
        [9030] = "A-功能",
        [9036] = "A-属性",
        [9088] = "A-属性",
        [9144] = "A-红蓝",
        [9149] = "工具",
        [9154] = "A-属性",
        [9155] = "A-AP",
        [9172] = "A-功能",
        [9179] = "A-属性",
        [9187] = "A-AD",
        [9197] = "A-属性",
        [9206] = "A-AD",
        [9224] = "A-AD",
        [9233] = "A-属性",
        [9240] = "工具",
        [9264] = "A-AP",
        [10498] = "工具",
        [10506] = "装备-特殊",
        [10513] = "A-BOOM",
        [10514] = "A-BOOM",
        [10560] = "A-BOOM",
        [10577] = "A-BOOM",
        [10586] = "A-BOOM",
        [10588] = "A-BOOM",
        [10588] = "装备-特殊",
        [10589] = "A-BOOM",
        [10592] = "A-功能",
        [10620] = "B-矿",
        [10644] = "A-BOOM",
        [10645] = "首饰-特殊",
        [10646] = "A-BOOM",
        [10716] = "首饰-特殊",
        [10726] = "装备-特殊",
        [10818] = "工具",
        [11026] = "坐骑宠物玩具",
        [11027] = "坐骑宠物玩具",
        [11122] = "首饰-特殊",
        [11243] = "A-属性",
        [11370] = "B-矿",
        [11371] = "B-矿",
        [11382] = "B-矿",
        [11511] = "工具",
        [11951] = "A-红蓝",
        [12190] = "A-红蓝",
        [12217] = "A-功能",
        [12344] = "工具",
        [12359] = "B-矿",
        [12360] = "B-矿",
        [12361] = "B-宝石",
        [12363] = "B-宝石",
        [12364] = "B-宝石",
        [12384] = "工具",
        [12404] = "A-涂剂",
        [12451] = "A-AD",
        [12460] = "A-AD",
        [12640] = "装备-物理",
        [12643] = "A-涂剂",
        [12655] = "B-矿",
        [12662] = "A-红蓝",
        [12800] = "B-宝石",
        [12809] = "B-宝石",
        [12820] = "A-AD",
        [13086] = "坐骑宠物玩具",
        [13180] = "A-BOOM",
        [13347] = "首饰-特殊",
        [13442] = "A-功能",
        [13443] = "A-红蓝",
        [13444] = "A-红蓝",
        [13445] = "A-属性",
        [13446] = "A-红蓝",
        [13452] = "A-AD",
        [13453] = "A-AD",
        [13454] = "A-AP",
        [13455] = "A-功能",
        [13456] = "A-属性",
        [13457] = "A-属性",
        [13458] = "A-属性",
        [13459] = "A-属性",
        [13461] = "A-属性",
        [13462] = "A-功能",
        [13463] = "B-草",
        [13464] = "B-草",
        [13465] = "B-草",
        [13466] = "B-草",
        [13467] = "B-草",
        [13468] = "B-草",
        [13506] = "A-合剂",
        [13510] = "A-合剂",
        [13511] = "A-合剂",
        [13512] = "A-合剂",
        [13513] = "A-合剂",
        [13724] = "A-吃喝",
        [13754] = "B-鱼",
        [13755] = "B-鱼",
        [13756] = "B-鱼",
        [13758] = "B-鱼",
        [13759] = "B-鱼",
        [13760] = "B-鱼",
        [13810] = "A-AD",
        [13813] = "A-属性",
        [13888] = "B-鱼",
        [13889] = "B-鱼",
        [13893] = "B-鱼",
        [13926] = "B-宝石",
        [13928] = "A-AD",
        [13931] = "A-属性",
        [13968] = "首饰-法系",
        [14022] = "首饰-特殊",
        [14023] = "首饰-特殊",
        [14047] = "B-布",
        [14048] = "B-布",
        [14146] = "装备-法系",
        [14152] = "装备-物理",
        [14153] = "装备-物理",
        [14154] = "装备-治疗",
        [14227] = "B-布",
        [14256] = "B-布",
        [14342] = "B-布",
        [14530] = "A-红蓝",
        [14551] = "装备-物理",
        [14552] = "装备-防御",
        [14553] = "装备-治疗",
        [14554] = "装备-物理",
        [14555] = "武器-单手",
        [15407] = "B-皮",
        [15993] = "A-BOOM",
        [16005] = "A-BOOM",
        [16022] = "首饰-特殊",
        [16024] = "A-BOOM",
        [16040] = "A-BOOM",
        [16309] = "工具",
        [16816] = "装备-暗抗",
        [16818] = "T2",
        [16832] = "T2",
        [16897] = "T2",
        [16898] = "T2",
        [16899] = "T2",
        [16900] = "T2",
        [16901] = "T2",
        [16902] = "T2",
        [16903] = "T2",
        [16904] = "T2",
        [16905] = "T2",
        [16906] = "T2",
        [16907] = "T2",
        [16908] = "T2",
        [16909] = "T2",
        [16910] = "T2",
        [16911] = "T2",
        [16912] = "T2",
        [16913] = "T2",
        [16914] = "T2",
        [16915] = "T2",
        [16916] = "T2",
        [16917] = "T2",
        [16918] = "T2",
        [16919] = "T2",
        [16920] = "T2",
        [16921] = "T2",
        [16922] = "T2",
        [16923] = "T2",
        [16924] = "T2",
        [16925] = "T2",
        [16926] = "T2",
        [16927] = "T2",
        [16928] = "T2",
        [16929] = "T2",
        [16930] = "T2",
        [16931] = "T2",
        [16932] = "T2",
        [16933] = "T2",
        [16934] = "T2",
        [16935] = "T2",
        [16936] = "T2",
        [16937] = "T2",
        [16938] = "T2",
        [16939] = "T2",
        [16940] = "T2",
        [16941] = "T2",
        [16942] = "T2",
        [16943] = "T2",
        [16944] = "T2",
        [16945] = "T2",
        [16946] = "T2",
        [16947] = "T2",
        [16948] = "T2",
        [16949] = "T2",
        [16950] = "T2",
        [16951] = "T2",
        [16952] = "T2",
        [16953] = "T2",
        [16954] = "T2",
        [16955] = "T2",
        [16956] = "T2",
        [16957] = "T2",
        [16958] = "T2",
        [16959] = "T2",
        [16960] = "T2",
        [16961] = "T2",
        [16962] = "T2",
        [16963] = "T2",
        [16964] = "T2",
        [16965] = "T2",
        [16966] = "T2",
        [17012] = "B-皮",
        [17056] = "材料",
        [17063] = "首饰-物理",
        [17065] = "首饰-防御",
        [17066] = "武器-副手",
        [17068] = "武器-单手",
        [17069] = "武器-远程",
        [17070] = "武器-单手",
        [17075] = "武器-单手",
        [17076] = "武器-双手",
        [17102] = "装备-披风",
        [17103] = "武器-单手",
        [17104] = "武器-双手",
        [17107] = "装备-披风",
        [17191] = "工具",
        [17193] = "武器-双手",
        [17202] = "坐骑宠物玩具",
        [17232] = "坐骑宠物玩具",
        [17333] = "工具",
        [17708] = "A-AP",
        [17712] = "坐骑宠物玩具",
        [17744] = "首饰-抗性",
        [17771] = "B-矿",
        [17849] = "战场",
        [17850] = "战场",
        [18045] = "A-属性",
        [18253] = "A-红蓝",
        [18254] = "A-属性",
        [18262] = "A-涂剂",
        [18263] = "装备-治疗",
        [18269] = "A-属性",
        [18294] = "A-属性",
        [18348] = "武器-单手",
        [18398] = "首饰-抗性",
        [18399] = "首饰-抗性",
        [18403] = "首饰-抗性",
        [18404] = "首饰-物理",
        [18406] = "首饰-防御",
        [18510] = "装备-披风",
        [18541] = "装备-披风",
        [18587] = "首饰-特殊",
        [18608] = "武器-双手",
        [18609] = "武器-双手",
        [18631] = "A-BOOM",
        [18634] = "首饰-抗性",
        [18637] = "A-BOOM",
        [18638] = "首饰-抗性",
        [18639] = "首饰-抗性",
        [18641] = "A-BOOM",
        [18713] = "武器-远程",
        [18805] = "武器-单手",
        [18806] = "装备-防御",
        [18809] = "装备-法系",
        [18810] = "装备-治疗",
        [18814] = "首饰-法系",
        [18816] = "武器-单手",
        [18817] = "装备-物理",
        [18820] = "首饰-法系",
        [18821] = "首饰-物理",
        [18823] = "装备-物理",
        [18829] = "装备-法系",
        [18832] = "武器-单手",
        [18839] = "战场",
        [18841] = "战场",
        [18842] = "武器-双手",
        [18854] = "首饰-特殊",
        [18856] = "首饰-特殊",
        [18857] = "首饰-特殊",
        [18858] = "首饰-特殊",
        [18859] = "首饰-特殊",
        [18862] = "首饰-特殊",
        [18863] = "首饰-特殊",
        [18864] = "首饰-特殊",
        [18875] = "装备-治疗",
        [18879] = "首饰-防御",
        [18984] = "首饰-特殊",
        [18986] = "首饰-特殊",
        [19045] = "战场",
        [19046] = "战场",
        [19130] = "武器-远程",
        [19131] = "装备-法系",
        [19132] = "装备-治疗",
        [19133] = "装备-法系",
        [19136] = "装备-法系",
        [19137] = "装备-物理",
        [19139] = "装备-防御",
        [19140] = "首饰-治疗",
        [19143] = "装备-物理",
        [19145] = "装备-法系",
        [19146] = "装备-物理",
        [19147] = "首饰-法系",
        [19149] = "装备-防御",
        [19157] = "装备-物理",
        [19162] = "装备-治疗",
        [19288] = "首饰-治疗",
        [19289] = "首饰-物理",
        [19301] = "A-吃喝",
        [19307] = "A-红蓝",
        [19308] = "武器-副手",
        [19312] = "武器-副手",
        [19318] = "A-吃喝",
        [19325] = "首饰-物理",
        [19334] = "武器-双手",
        [19335] = "武器-单手",
        [19339] = "首饰-法系",
        [19344] = "首饰-法系",
        [19345] = "首饰-特殊",
        [19347] = "武器-单手",
        [19349] = "武器-副手",
        [19351] = "武器-单手",
        [19352] = "武器-单手",
        [19356] = "武器-双手",
        [19358] = "武器-双手",
        [19360] = "武器-单手",
        [19361] = "武器-远程",
        [19362] = "武器-单手",
        [19363] = "武器-单手",
        [19366] = "武器-副手",
        [19368] = "武器-远程",
        [19370] = "装备-法系",
        [19371] = "首饰-治疗",
        [19374] = "装备-法系",
        [19375] = "装备-法系",
        [19376] = "首饰-防御",
        [19377] = "首饰-物理",
        [19378] = "装备-披风",
        [19379] = "首饰-法系",
        [19380] = "装备-物理",
        [19381] = "装备-防御",
        [19382] = "首饰-治疗",
        [19383] = "首饰-防御",
        [19384] = "首饰-物理",
        [19385] = "装备-治疗",
        [19386] = "装备-披风",
        [19387] = "装备-物理",
        [19389] = "装备-防御",
        [19390] = "装备-治疗",
        [19391] = "装备-治疗",
        [19394] = "装备-物理",
        [19395] = "首饰-治疗",
        [19396] = "装备-物理",
        [19397] = "首饰-法系",
        [19398] = "装备-披风",
        [19400] = "装备-法系",
        [19402] = "装备-物理",
        [19403] = "首饰-法系",
        [19405] = "装备-防御",
        [19406] = "首饰-物理",
        [19407] = "装备-法系",
        [19430] = "装备-披风",
        [19431] = "首饰-防御",
        [19432] = "首饰-物理",
        [19434] = "首饰-法系",
        [19435] = "武器-远程",
        [19436] = "装备-披风",
        [19437] = "装备-治疗",
        [19438] = "装备-法系",
        [19440] = "A-功能",
        [19726] = "B-宝石",
        [19855] = "装备-防御",
        [19857] = "装备-披风",
        [19859] = "武器-单手",
        [19861] = "武器-远程",
        [19885] = "首饰-治疗",
        [19947] = "首饰-特殊",
        [19948] = "首饰-防御",
        [19950] = "首饰-法系",
        [19979] = "首饰-特殊",
        [20002] = "A-红蓝",
        [20007] = "A-属性",
        [20008] = "A-功能",
        [20031] = "A-吃喝",
        [20079] = "A-非专业",
        [20080] = "A-非专业",
        [20081] = "A-非专业",
        [20264] = "装备-治疗",
        [20397] = "坐骑宠物玩具",
        [20398] = "坐骑宠物玩具",
        [20399] = "坐骑宠物玩具",
        [20409] = "坐骑宠物玩具",
        [20410] = "坐骑宠物玩具",
        [20411] = "坐骑宠物玩具",
        [20413] = "坐骑宠物玩具",
        [20414] = "坐骑宠物玩具",
        [20452] = "A-AD",
        [20520] = "A-红蓝",
        [20537] = "装备-暗抗",
        [20538] = "装备-暗抗",
        [20539] = "装备-暗抗",
        [20557] = "坐骑宠物玩具",
        [20558] = "战场",
        [20559] = "战场",
        [20560] = "战场",
        [20600] = "首饰-抗性",
        [20623] = "装备-防御",
        [20626] = "装备-法系",
        [20627] = "装备-防御",
        [20628] = "装备-治疗",
        [20632] = "首饰-法系",
        [20636] = "首饰-治疗",
        [20685] = "首饰-治疗",
        [20709] = "A-属性",
        [20748] = "A-涂剂",
        [20749] = "A-涂剂",
        [21023] = "A-属性",
        [21038] = "坐骑宠物玩具",
        [21071] = "B-鱼",
        [21114] = "A-属性",
        [21126] = "武器-单手",
        [21134] = "武器-双手",
        [21151] = "A-属性",
        [21153] = "B-鱼",
        [21171] = "工具",
        [21186] = "装备-法系",
        [21190] = "首饰-法系",
        [21200] = "首饰-防御",
        [21205] = "首饰-物理",
        [21210] = "首饰-法系",
        [21215] = "A-吃喝",
        [21217] = "A-属性",
        [21217] = "B-鱼",
        [21235] = "A-吃喝",
        [21241] = "A-吃喝",
        [21242] = "武器-单手",
        [21244] = "武器-单手",
        [21268] = "武器-单手",
        [21269] = "武器-副手",
        [21329] = "T2.5",
        [21330] = "T2.5",
        [21331] = "T2.5",
        [21332] = "T2.5",
        [21333] = "T2.5",
        [21334] = "T2.5",
        [21335] = "T2.5",
        [21336] = "T2.5",
        [21337] = "T2.5",
        [21338] = "T2.5",
        [21343] = "T2.5",
        [21344] = "T2.5",
        [21345] = "T2.5",
        [21346] = "T2.5",
        [21347] = "T2.5",
        [21348] = "T2.5",
        [21349] = "T2.5",
        [21350] = "T2.5",
        [21351] = "T2.5",
        [21352] = "T2.5",
        [21353] = "T2.5",
        [21354] = "T2.5",
        [21355] = "T2.5",
        [21356] = "T2.5",
        [21357] = "T2.5",
        [21359] = "T2.5",
        [21360] = "T2.5",
        [21361] = "T2.5",
        [21362] = "T2.5",
        [21364] = "T2.5",
        [21365] = "T2.5",
        [21366] = "T2.5",
        [21367] = "T2.5",
        [21368] = "T2.5",
        [21370] = "T2.5",
        [21372] = "T2.5",
        [21373] = "T2.5",
        [21374] = "T2.5",
        [21375] = "T2.5",
        [21376] = "T2.5",
        [21387] = "T2.5",
        [21388] = "T2.5",
        [21389] = "T2.5",
        [21390] = "T2.5",
        [21391] = "T2.5",
        [21461] = "装备-物理",
        [21463] = "装备-物理",
        [21464] = "装备-法系",
        [21493] = "装备-物理",
        [21529] = "首饰-抗性",
        [21536] = "坐骑宠物玩具",
        [21537] = "A-吃喝",
        [21540] = "坐骑宠物玩具",
        [21546] = "A-AP",
        [21579] = "首饰-特殊",
        [21581] = "装备-物理",
        [21582] = "装备-治疗",
        [21583] = "装备-披风",
        [21585] = "装备-法系",
        [21586] = "装备-物理",
        [21597] = "武器-副手",
        [21598] = "装备-防御",
        [21600] = "装备-法系",
        [21601] = "首饰-防御",
        [21602] = "装备-防御",
        [21603] = "武器-远程",
        [21604] = "装备-治疗",
        [21605] = "装备-防御",
        [21608] = "首饰-法系",
        [21610] = "武器-副手",
        [21611] = "装备-法系",
        [21615] = "装备-治疗",
        [21617] = "装备-治疗",
        [21618] = "装备-物理",
        [21619] = "装备-治疗",
        [21620] = "首饰-治疗",
        [21622] = "武器-单手",
        [21623] = "装备-物理",
        [21624] = "装备-物理",
        [21627] = "装备-暗抗",
        [21639] = "装备-防御",
        [21647] = "首饰-特殊",
        [21650] = "武器-单手",
        [21651] = "装备-物理",
        [21663] = "装备-治疗",
        [21665] = "装备-物理",
        [21666] = "武器-副手",
        [21667] = "装备-治疗",
        [21670] = "首饰-物理",
        [21671] = "装备-法系",
        [21672] = "装备-物理",
        [21673] = "武器-单手",
        [21674] = "装备-防御",
        [21675] = "装备-防御",
        [21676] = "装备-法系",
        [21678] = "首饰-抗性",
        [21680] = "装备-物理",
        [21681] = "首饰-治疗",
        [21684] = "装备-物理",
        [21685] = "首饰-抗性",
        [21687] = "首饰-抗性",
        [21693] = "装备-防御",
        [21697] = "装备-披风",
        [21701] = "装备-披风",
        [21705] = "装备-物理",
        [21706] = "装备-防御",
        [21707] = "首饰-法系",
        [21709] = "首饰-法系",
        [21710] = "装备-披风",
        [21712] = "首饰-治疗",
        [21814] = "装备-物理",
        [21836] = "首饰-法系",
        [21838] = "装备-暗抗",
        [21839] = "武器-单手",
        [22192] = "A-属性",
        [22193] = "A-属性",
        [22218] = "坐骑宠物玩具",
        [22225] = "装备-暗抗",
        [22236] = "A-属性",
        [22237] = "A-AD",
        [22238] = "A-AP",
        [22239] = "A-治疗",
        [22385] = "装备-物理",
        [22416] = "T3",
        [22417] = "T3",
        [22418] = "T3",
        [22419] = "T3",
        [22420] = "T3",
        [22421] = "T3",
        [22422] = "T3",
        [22423] = "T3",
        [22424] = "T3",
        [22425] = "T3",
        [22426] = "T3",
        [22427] = "T3",
        [22428] = "T3",
        [22429] = "T3",
        [22430] = "T3",
        [22431] = "T3",
        [22436] = "T3",
        [22437] = "T3",
        [22438] = "T3",
        [22439] = "T3",
        [22440] = "T3",
        [22441] = "T3",
        [22442] = "T3",
        [22443] = "T3",
        [22464] = "T3",
        [22465] = "T3",
        [22466] = "T3",
        [22467] = "T3",
        [22468] = "T3",
        [22469] = "T3",
        [22470] = "T3",
        [22471] = "T3",
        [22476] = "T3",
        [22477] = "T3",
        [22478] = "T3",
        [22479] = "T3",
        [22480] = "T3",
        [22481] = "T3",
        [22482] = "T3",
        [22483] = "T3",
        [22488] = "T3",
        [22489] = "T3",
        [22490] = "T3",
        [22491] = "T3",
        [22492] = "T3",
        [22493] = "T3",
        [22494] = "T3",
        [22495] = "T3",
        [22496] = "T3",
        [22497] = "T3",
        [22498] = "T3",
        [22499] = "T3",
        [22500] = "T3",
        [22501] = "T3",
        [22502] = "T3",
        [22503] = "T3",
        [22504] = "T3",
        [22505] = "T3",
        [22506] = "T3",
        [22507] = "T3",
        [22508] = "T3",
        [22509] = "T3",
        [22510] = "T3",
        [22511] = "T3",
        [22512] = "T3",
        [22513] = "T3",
        [22514] = "T3",
        [22515] = "T3",
        [22516] = "T3",
        [22517] = "T3",
        [22518] = "T3",
        [22519] = "T3",
        [22663] = "装备-防御",
        [22691] = "武器-双手",
        [22707] = "首饰-抗性",
        [22730] = "装备-法系",
        [22731] = "装备-披风",
        [22732] = "首饰-防御",
        [22740] = "装备-防御",
        [22749] = "装备-防御",
        [22754] = "工具",
        [22798] = "武器-双手",
        [22802] = "武器-单手",
        [22807] = "武器-单手",
        [22812] = "武器-远程",
        [22816] = "武器-单手",
        [22818] = "武器-副手",
        [22819] = "武器-副手",
        [22820] = "武器-远程",
        [22821] = "武器-远程",
        [22935] = "首饰-抗性",
        [22936] = "装备-物理",
        [22938] = "装备-披风",
        [22939] = "首饰-治疗",
        [22943] = "首饰-法系",
        [22954] = "首饰-物理",
        [22960] = "装备-披风",
        [22961] = "首饰-物理",
        [22983] = "装备-法系",
        [22988] = "武器-单手",
        [23000] = "装备-物理",
        [23001] = "首饰-法系",
        [23009] = "武器-远程",
        [23018] = "首饰-防御",
        [23021] = "装备-法系",
        [23025] = "首饰-法系",
        [23027] = "首饰-治疗",
        [23028] = "首饰-抗性",
        [23031] = "首饰-法系",
        [23035] = "装备-法系",
        [23036] = "首饰-治疗",
        [23038] = "首饰-物理",
        [23041] = "首饰-物理",
        [23042] = "首饰-抗性",
        [23043] = "武器-副手",
        [23045] = "装备-披风",
        [23046] = "首饰-法系",
        [23047] = "首饰-治疗",
        [23048] = "武器-副手",
        [23049] = "武器-副手",
        [23050] = "装备-披风",
        [23053] = "首饰-物理",
        [23054] = "武器-单手",
        [23056] = "武器-单手",
        [23057] = "首饰-法系",
        [23061] = "首饰-治疗",
        [23069] = "装备-法系",
        [23070] = "装备-法系",
        [23071] = "装备-物理",
        [23075] = "武器-副手",
        [23122] = "A-涂剂",
        [23123] = "A-涂剂",
        [23206] = "首饰-物理",
        [23207] = "首饰-法系",
        [23219] = "装备-物理",
        [23220] = "装备-法系",
        [23226] = "装备-防御",
        [23237] = "首饰-法系",
        [23246] = "坐骑宠物玩具",
        [23326] = "A-AP",
        [23327] = "A-AD",
        [23570] = "首饰-物理",
        [23577] = "武器-单手",
        [23737] = "A-BOOM",
        [23781] = "A-BOOM",
        [23811] = "A-BOOM",
        [23814] = "A-BOOM",
        [23815] = "A-BOOM",
        [23826] = "A-BOOM",
        [23841] = "A-BOOM",
        [33633] = "A-BOOM",
        [33634] = "A-BOOM",
        [40536] = "A-BOOM",
        [40771] = "A-BOOM",
        [184937] = "工具",
        [184938] = "工具",
        [212160] = "工具",
}

local consumableCache = {}
local scanner = nil

local function GetDynamicCategory(itemLink, itemID, isEquippable)
    if not itemLink then return nil end
    
    if consumableCache[itemID] then
        if consumableCache[itemID] == "NONE" then return nil end
        return consumableCache[itemID]
    end
    
    local text = ""
    
    -- In modern WoW / Classic Era 1.15+, hidden GameTooltips don't populate TextLeft fontstrings.
    -- We must use C_TooltipInfo.GetHyperlink instead. Safe pcall to prevent crashes.
    if C_TooltipInfo and C_TooltipInfo.GetHyperlink then
        local success, tooltipData = pcall(C_TooltipInfo.GetHyperlink, itemLink)
        if success and tooltipData and tooltipData.lines then
            for i, line in ipairs(tooltipData.lines) do
                if TooltipUtil and TooltipUtil.SurfaceArgs then
                    pcall(TooltipUtil.SurfaceArgs, line)
                end
                if line.leftText then
                    text = text .. " " .. line.leftText
                end
            end
        end
    end

    -- Fallback for older clients or if C_TooltipInfo failed
    if text == "" then
        if not scanner then
            scanner = CreateFrame("GameTooltip", "OnesftoBetterBagsTooltipScanner", nil, "GameTooltipTemplate")
        end
        scanner:SetOwner(WorldFrame, "ANCHOR_NONE")
        scanner:ClearLines()
        pcall(function() scanner:SetHyperlink(itemLink) end)
        for i = 1, scanner:NumLines() do
            local lineObj = _G["OnesftoBetterBagsTooltipScannerTextLeft" .. i]
            if lineObj and lineObj.GetText then
                local lineText = lineObj:GetText()
                if lineText then
                    text = text .. " " .. lineText
                end
            end
        end
    end

    if text == "" then
        return nil
    end

    -- 移除所有颜色代码，防止 string.match 失败
    text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
    text = string.gsub(text, "|r", "")

    local cat = nil
    if string.match(text, "召唤或解散") or string.match(text, "右键点击以召唤") or string.match(text, "这是一种速度非常快的坐骑") or string.match(text, "发出高频声波") then
        cat = "坐骑宠物玩具"
    end
    
    if cat then consumableCache[itemID] = cat end
    return cat
end

local function OnPlayerLogin()
    local bb = AceAddon:GetAddon("BetterBags", true)
    if not bb then return end

    -- 隐藏原生背包条
    local bagBarFrames = {
        "MainMenuBarBackpackButton",
        "CharacterBag0Slot",
        "CharacterBag1Slot",
        "CharacterBag2Slot",
        "CharacterBag3Slot",
        "KeyRingButton"
    }
    for _, frameName in ipairs(bagBarFrames) do
        local frame = _G[frameName]
        if frame then
            frame:Hide()
            frame.Show = function() end
            frame:UnregisterAllEvents()
        end
    end

    local categories = bb:GetModule("Categories", true)
    if not categories then return end

    local equipGroup = {
        ["INVTYPE_HEAD"] = true,
        ["INVTYPE_SHOULDER"] = true,
        ["INVTYPE_CHEST"] = true,
        ["INVTYPE_ROBE"] = true,
        ["INVTYPE_WAIST"] = true,
        ["INVTYPE_LEGS"] = true,
        ["INVTYPE_FEET"] = true,
        ["INVTYPE_WRIST"] = true,
        ["INVTYPE_HAND"] = true,
        ["INVTYPE_CLOAK"] = true,
    }

    local jewelryGroup = {
        ["INVTYPE_NECK"] = true,
        ["INVTYPE_FINGER"] = true,
        ["INVTYPE_TRINKET"] = true,
    }

    local weaponGroup = {
        ["INVTYPE_WEAPON"] = "武器-单手",
        ["INVTYPE_WEAPONMAINHAND"] = "武器-单手",
        ["INVTYPE_WEAPONOFFHAND"] = "武器-单手",
        ["INVTYPE_2HWEAPON"] = "武器-双手",
        ["INVTYPE_RANGED"] = "武器-远程",
        ["INVTYPE_RANGEDRIGHT"] = "武器-远程",
        ["INVTYPE_THROWN"] = "武器-远程",
        ["INVTYPE_RELIC"] = "武器-远程",
        ["INVTYPE_SHIELD"] = "武器-副手",
        ["INVTYPE_HOLDABLE"] = "武器-副手"
    }

    categories:RegisterCategoryFunction("Onesfto_TierSets", function(data)
        if not data or not data.itemInfo or not data.itemInfo.itemID then return nil end
        
        local itemID = tonumber(data.itemInfo.itemID)
        local loc = data.itemInfo.itemEquipLoc or data.itemInfo.equipLocation
        local isEquippable = loc and loc ~= "" and loc ~= "INVTYPE_BAG" and loc ~= "INVTYPE_NON_EQUIP"
        
        -- Override with Custom CSV logic first
        if Custom_CSV_Items[itemID] then 
            return Custom_CSV_Items[itemID]
        end

        local dynamicCat = GetDynamicCategory(data.itemInfo.itemLink, itemID, isEquippable)
        if dynamicCat then
            return dynamicCat
        end

        if data.itemInfo.itemSubType == "附魔" or data.itemInfo.itemSubType == "Enchanting" then
            return "B-附魔"
        end

        if data.itemInfo.itemName then
            local name = data.itemInfo.itemName
            if string.match(name, "^大元帅的") or 
               string.match(name, "^元帅的") or 
               string.match(name, "^统帅的") or 
               string.match(name, "^司令的") or 
               string.match(name, "^少校的") or 
               string.match(name, "^骑士队长的") or 
               string.match(name, "^骑士中尉的") or 
               string.match(name, "^高阶督军的") or 
               string.match(name, "^督军的") or 
               string.match(name, "^将军的") or 
               string.match(name, "^勇士的") or 
               string.match(name, "^百夫长的") or 
               string.match(name, "^血卫士的") or 
               string.match(name, "^军团士兵的") then
                return "军装"
            end
        end

        if loc and loc ~= "" then
            if data.itemInfo.itemName then
                local name = data.itemInfo.itemName
                if data.itemInfo.itemQuality == 4 then
                    if string.match(name, "^破冰") or 
                       string.match(name, "^北极") or 
                       string.match(name, "^寒鳞") or 
                       string.match(name, "^冰川") or 
                       string.match(name, "拉马兰迪的寒冰之握") then
                        return "装备-冰抗"
                    end
                end
            end
            
            if equipGroup[loc] then
                return "装备"
            elseif jewelryGroup[loc] then
                return "首饰"
            elseif weaponGroup[loc] then
                return weaponGroup[loc]
            end
        end

        return nil
    end)

    local customCategories = {
        "A-AD", "A-AP", "A-BOOM", "A-功能", "A-吃喝", "A-合剂", "A-属性", "A-武器", "A-治疗", "A-涂剂", "A-红蓝", "A-非专业", "B-宝石", "B-布", "B-皮", "B-矿", "B-草", "B-附魔", "B-鱼", "T2", "T2.5", "T3", "坐骑宠物玩具", "工具", "战场", "材料", "武器-副手", "武器-单手", "武器-双手", "武器-远程", "装备-冰抗", "装备-抗性", "装备-披风", "装备-暗抗", "装备-治疗", "装备-法系", "装备-火抗", "装备-物理", "装备-特殊", "装备-自然抗", "装备-防御", "首饰-抗性", "首饰-治疗", "首饰-法系", "首饰-物理", "首饰-特殊", "首饰-防御"
    }
    
    for _, catName in ipairs(customCategories) do
        if not categories:DoesCategoryExist(catName) then
            categories:CreateCategory({
                name = catName,
                itemList = {},
                save = true,
                note = ""
            })
        end
    end

    -- Hook section title drawing to strip 'A-' and 'B-' prefixes for cleaner display
    local sectionFrame = bb:GetModule("SectionFrame", true)
    if sectionFrame and sectionFrame.Create then
        local oldCreate = sectionFrame.Create
        sectionFrame.Create = function(self, ctx)
            local section = oldCreate(self, ctx)
            if section and not section.OnesftoHooked then
                local oldSetTitle = section.SetTitle
                if oldSetTitle then
                    section.SetTitle = function(s, text, color)
                        if type(text) == "string" then
                            -- Strip "A-" or "B-" prefix from the display text
                            text = string.gsub(text, "^[AB]%-", "")
                        end
                        oldSetTitle(s, text, color)
                    end
                end
                section.OnesftoHooked = true
            end
            return section
        end
    end

    -- 1. Setup Custom Groups properly through BetterBags DB module
    local db = bb:GetModule("Database", true)
    if db then
        local backpackGroup
        local ciyawGroup
        local yaoshiGroup
        
        -- AceDB defaults won't show in pairs, so we check standard indices
        for id = 1, 10 do
            local group = db:GetGroup(0, id)
            if group then
                if group.name == "Backpack" or group.name == "背包" or group.name == "主要" then
                    backpackGroup = group
                end
                if group.name == "次要" then
                    ciyawGroup = group
                end
                if group.name == "钥匙" then
                    yaoshiGroup = group
                end
            end
        end
        
        if backpackGroup and (backpackGroup.name == "Backpack" or backpackGroup.name == "背包") then
            db:RenameGroup(0, backpackGroup.id, "主要")
        end
        
        if not ciyawGroup then
            db:CreateGroup(0, "次要")
        end
        
        local yaoshiID = nil
        if not yaoshiGroup then
            yaoshiID = db:CreateGroup(0, "钥匙")
        else
            yaoshiID = yaoshiGroup.id
        end
        
        if yaoshiID then
            if db:GetCategoryGroup(0, "Keys") ~= yaoshiID then
                db:SetCategoryGroup(0, "Keys", yaoshiID)
            end
            if db:GetCategoryGroup(0, "钥匙") ~= yaoshiID then
                db:SetCategoryGroup(0, "钥匙", yaoshiID)
            end
        end
    end

    -- 2. Inject Missing Localization
    local loc = bb:GetModule("Localization", true)
    if loc and loc.data then
        if not loc.data["Create New Backpack Tab"] then loc.data["Create New Backpack Tab"] = {} end
        if not loc.data["Create New Backpack Tab"] then loc.data["Create New Backpack Tab"] = {} end
        loc.data["Create New Backpack Tab"]["zhCN"] = "创建新背包分组"
        loc.data["Create New Backpack Tab"]["zhTW"] = "創建新背包分組"
        
        if not loc.data["Enter group name:"] then loc.data["Enter group name:"] = {} end
        loc.data["Enter group name:"]["zhCN"] = "输入分组名称："
        loc.data["Enter group name:"]["zhTW"] = "輸入分組名稱："
        
        local dragStr = "Drag a section header to this tab at the bottom of the window to add a section to this group!"
        if not loc.data[dragStr] then loc.data[dragStr] = {} end
        loc.data[dragStr]["zhCN"] = "将分类标题拖动到底部的此标签，即可将其移入该分组！"
        loc.data[dragStr]["zhTW"] = "將分類標題拖動到底部的此標籤，即可將其移入該分組！"
    end

    -- 3. Monkey patch Question module to inherit ElvUI skin if loaded
    if ElvUI then
        local E = unpack(ElvUI)
        local S = E:GetModule("Skins")
        if S then
            local question = bb:GetModule("Question", true)
            if question and question._OnCreate and not question.OnesftoHooked then
                local oldCreate = question._OnCreate
                question._OnCreate = function(self, ...)
                    local q = oldCreate(self, ...)
                    if q and q.frame and not q.OnesftoSkinned then
                        S:HandleFrame(q.frame)
                        if q.yes then S:HandleButton(q.yes) end
                        if q.no then S:HandleButton(q.no) end
                        if q.ok then S:HandleButton(q.ok) end
                        if q.input then S:HandleEditBox(q.input) end
                        q.OnesftoSkinned = true
                    end
                    return q
                end
                question.OnesftoHooked = true
            end
            
            -- 4. Fix ElvUI Theme Tab Text alignment
            local themes = bb:GetModule("Themes", true)
            if themes and themes.themes and themes.themes['elvui'] then
                local elvuiTheme = themes.themes['elvui']
                if elvuiTheme.Tab and not elvuiTheme.OnesftoTabHooked then
                    local oldTab = elvuiTheme.Tab
                    elvuiTheme.Tab = function(tab)
                        local dec = oldTab(tab)
                        local fs = dec and dec.Text
                        if fs then
                            if dec.backdrop and not dec.OnesftoTextHooked then
                                dec.OnesftoTextHooked = true
                                local oldSetPoint = fs.SetPoint
                                fs.SetPoint = function(self, point, relFrame, relPoint, x, y)
                                    oldSetPoint(self, "CENTER", dec.backdrop, "CENTER", 0, 0)
                                end
                            end
                            fs:ClearAllPoints()
                            if dec.backdrop then
                                fs:SetPoint("CENTER", dec.backdrop, "CENTER", 0, 0)
                            else
                                fs:SetPoint("CENTER", dec, "CENTER", 0, -8)
                            end
                        end
                        return dec
                    end
                    elvuiTheme.OnesftoTabHooked = true
                end
            end
        end
    end

    -- 5. Retroactively fix existing tabs and FontStrings (since views might be created before PLAYER_LOGIN)
    for _, prefix in pairs({"BetterBagsBagBackpack", "BetterBagsBagBank"}) do
        local bagFrame = _G[prefix]
        if bagFrame then
            -- Fix Help Text
            local function ScanRegions(frame)
                if not frame then return end
                for _, region in pairs({frame:GetRegions()}) do
                    if region:GetObjectType() == "FontString" then
                        local text = region:GetText()
                        if text and text:find("Drag a section header") then
                            region:SetText("将分类标题拖动到底部的此标签，即可将其移入该分组！")
                        end
                    end
                end
                for _, child in pairs({frame:GetChildren()}) do
                    ScanRegions(child)
                end
            end
            ScanRegions(bagFrame)
            
            -- Fix Tabs
            for i = 0, 20 do
                local tab = _G[prefix .. "TabContainerTab" .. i]
                if tab then
                    local dec = _G[tab:GetName() .. "default"]
                    local fs = dec and dec.Text
                    if fs then
                        if dec.backdrop and not dec.OnesftoTextHooked then
                            dec.OnesftoTextHooked = true
                            local oldSetPoint = fs.SetPoint
                            fs.SetPoint = function(self, point, relFrame, relPoint, x, y)
                                oldSetPoint(self, "CENTER", dec.backdrop, "CENTER", 0, 0)
                            end
                        end
                        fs:ClearAllPoints()
                        if dec.backdrop then
                            fs:SetPoint("CENTER", dec.backdrop, "CENTER", 0, 0)
                        else
                            fs:SetPoint("CENTER", dec, "CENTER", 0, -8)
                        end
                    end
                end
            end
        end
    end


end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin()
    end
end)
