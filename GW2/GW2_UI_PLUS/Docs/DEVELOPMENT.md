# GW2_UI_PLUS 开发指南

## 开发环境

### 必需
- World of Warcraft Classic Era 客户端
- GW2_UI 主插件
- 文本编辑器（推荐 VS Code）

### 推荐插件
- WoW Lua 语法高亮
- Lua 格式化工具

## 项目结构

### 模块组织

每个功能模块位于 `Modules/` 下：

```
Modules/ModuleName/
├── README.md           模块说明
├── ModuleName.lua      主入口
├── Core.lua            核心逻辑（可选）
├── Layout.lua          布局（可选）
└── Options.lua         设置面板（可选）
```

### 文件命名规范

- **模块主文件**: `ModuleName.lua`
- **拆分文件**: `ModuleName_SubModule.lua`
- **工具文件**: `ModuleName_Utils.lua`
- **文档**: `README.md`

## 编码规范

### 命名约定

- **模块**: PascalCase (`ActionBar`, `ChatWindow`)
- **函数**: PascalCase (`ApplyLayout`, `InitDB`)
- **变量**: camelCase (`currentValue`, `isEnabled`)
- **常量**: UPPER_SNAKE_CASE (`MAX_SIZE`, `DEFAULT_COLOR`)
- **私有函数**: 不导出，使用 `local function`

### 代码组织

```lua
local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local ModuleName = {}
addonTable.ModuleName = ModuleName

local CONSTANT_VALUE = 100

local function PrivateHelper()
end

function ModuleName.PublicFunction()
end

local function Init()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        Init()
    end
end)
```

### 文件大小限制

- **单文件**: < 500 行
- **函数**: < 100 行
- **超出限制**: 拆分为多个文件

### 代码风格

```lua
if condition then
    doSomething()
end

for i = 1, 10 do
    process(i)
end

function ModuleName.FunctionName(param1, param2)
    local result = param1 + param2
    return result
end
```

## 模块开发流程

### 1. 创建模块

```lua
local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local MyModule = {}
addonTable.MyModule = MyModule

function MyModule.Init()
end
```

### 2. 注册到 TOC

在 `GW2_UI_PLUS.toc` 添加：

```
Modules/MyModule/MyModule.lua
```

### 3. 初始化

```lua
local function Init()
    MyModule.Init()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        Init()
    end
end)
```

### 4. 添加存档

在 `GW2_UI_PLUS.toc` 添加：

```
## SavedVariables: ..., GW2_UI_PLUS_MyModuleSV
```

使用存档：

```lua
local defaults = {
    enabled = true,
    value = 100,
}

local db

local function InitDB()
    if not GW2_UI_PLUS_MyModuleSV then
        GW2_UI_PLUS_MyModuleSV = {}
    end
    db = GW2_UI_PLUS_MyModuleSV
    for key, value in pairs(defaults) do
        if db[key] == nil then
            db[key] = value
        end
    end
    return db
end
```

### 5. 创建设置面板

```lua
local function BuildPanel(parent)
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    
    panel:AddOption("启用模块", "描述", {
        getter = function() return db.enabled end,
        setter = function(value) db.enabled = value end,
        getDefault = function() return defaults.enabled end,
    })
    
    return panel
end

GW.LoadOnDemand({
    addon = "GW2_UI_PLUS",
    callback = function()
        GW.RegisterAddonSettingsPanel("my_module", BuildPanel, "我的模块")
    end,
})
```

## 性能优化

### 使用节流器

```lua
local Perf = addonTable.Performance

frame:SetScript("OnUpdate", function(self, elapsed)
    Perf.Throttle("update", 0.1, function()
    end)
end)
```

### 缓存全局变量

```lua
local UnitHealth = Perf.CacheGlobal("UnitHealth", "UnitHealth")
local GetTime = Perf.CacheGlobal("GetTime", "GetTime")
```

### 避免频繁创建

```lua
local reusableTable = {}

function ProcessData(data)
    wipe(reusableTable)
    for k, v in pairs(data) do
        reusableTable[k] = v
    end
end
```

## 调试技巧

### 打印调试

```lua
print("Debug:", value)
DEFAULT_CHAT_FRAME:AddMessage("Info: " .. tostring(value))
```

### 错误处理

```lua
local ok, err = pcall(function()
end)
if not ok then
    print("Error:", err)
end
```

## 文档

### 模块 README

每个模块必须有 `README.md`：

```markdown
# ModuleName 模块

功能说明。

## 文件结构

- `ModuleName.lua` - 主入口
- `Core.lua` - 核心逻辑

## 配置项

- `enabled` - 是否启用
- `value` - 数值设置

## API

### ModuleName.Init()

初始化模块。
```

### API 文档

公共函数必须在 `Docs/API.md` 中记录。

## 提交代码

### Git 提交信息

```
类型: 简短描述

详细说明（可选）

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>
```

类型：
- `feat`: 新功能
- `fix`: Bug 修复
- `refactor`: 重构
- `docs`: 文档
- `perf`: 性能优化
- `style`: 代码格式

### Pull Request

1. Fork 项目
2. 创建分支: `git checkout -b feature/my-feature`
3. 提交代码: `git commit -am 'feat: add feature'`
4. 推送分支: `git push origin feature/my-feature`
5. 创建 Pull Request

## 发布流程

1. 更新版本号
2. 更新 CHANGELOG
3. 创建 Git tag
4. 打包发布

## 常见问题

### 模块不加载

- 检查 TOC 文件顺序
- 检查依赖模块是否存在
- 查看 Lua 错误

### 存档丢失

- 确认 SavedVariables 已注册
- 检查变量名拼写
- 查看 WTF 目录权限

### 性能问题

- 减少 OnUpdate 使用
- 使用节流器
- 缓存全局变量查找
- 避免频繁创建对象

## 资源

- [WoW API 文档](https://wowpedia.fandom.com/wiki/World_of_Warcraft_API)
- [Lua 5.1 参考手册](https://www.lua.org/manual/5.1/)
- [GW2_UI 文档](https://github.com/Mortalknight/GW2_UI)

## 联系

有问题请提交 Issue。
