local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Syndromehsh/Lua/refs/heads/main/AlienX/AlienX%20Wind%203.0%20UI.txt"))()

task.wait(2)

WindUI:Notify({
    Title = "AlienX",
    Content = "被遗弃",
    Duration = 4
})

task.wait(0.5)

local player = game.Players.LocalPlayer

local Window = WindUI:CreateWindow({
    Title = "AlienX<font color='#00FF00'>2.0</font> / 被遗弃",
    Icon = "rbxassetid://4483362748",
    IconTransparency = 1,
    Author = "AlienX",
    Folder = "AlienX",
    Size = UDim2.fromOffset(100, 150),
    Transparent = true,
    Theme = "Dark",
    UserEnabled = true,
    SideBarWidth = 200,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Username = player.Name,
        DisplayName = player.DisplayName,
        UserId = player.UserId,
        Thumbnail = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png",
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "玩家: " .. player.Name .. " (" .. player.DisplayName .. ")",
                Duration = 3
            })
        end
    }
})

task.wait(0.3)

Window:EditOpenButton({
    Title = "AlienX",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FF7F00")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("9400D3"))
    }),
    Draggable = true,
})

task.wait(0.2)

-- 创建标签页和部分
local Tabs = {
    Main = Window:Section({ Title = "功能", Opened = true }),
    Settings = Window:Section({ Title = "设置", Opened = true }),
    Utilities = Window:Section({ Title = "工具", Opened = true })
}

-- 创建标签页句柄
local TabHandles = {
    Elements = Tabs.Main:Tab({ Title = "UI元素", Icon = "layout-grid" }),
    Appearance = Tabs.Settings:Tab({ Title = "外观", Icon = "brush" }),
    Config = Tabs.Utilities:Tab({ Title = "配置", Icon = "settings" })
}

-- 添加段落
TabHandles.Elements:Paragraph({
    Title = "交互式组件",
    Desc = "探索AlienX的强大元素",
    Image = "component",
    ImageSize = 20,
    Color = "White",
})

TabHandles.Elements:Divider()

-- 添加开关
local toggleState = false
local featureToggle = TabHandles.Elements:Toggle({
    Title = "启用高级功能",
    Desc = "解锁额外功能",
    Value = false,
    Callback = function(state) 
        toggleState = state
        WindUI:Notify({
            Title = "功能",
            Content = state and "功能已启用" or "功能已禁用",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

-- 添加滑块
local intensitySlider = TabHandles.Elements:Slider({
    Title = "效果强度",
    Desc = "调整效果强度",
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(value)
        print("强度设置为:", value)
    end
})

-- 添加下拉菜单
local modeDropdown = TabHandles.Elements:Dropdown({
    Title = "选择模式",
    Values = { "标准", "高级", "专家" },
    Value = "标准",
    Callback = function(option)
        WindUI:Notify({
            Title = "模式已更改",
            Content = "已选择: "..option,
            Duration = 2
        })
    end
})

TabHandles.Elements:Divider()

-- 添加按钮
TabHandles.Elements:Button({
    Title = "显示通知",
    Icon = "bell",
    Callback = function()
        WindUI:Notify({
            Title = "你好 AlienX!",
            Content = "这是一个示例通知",
            Icon = "bell",
            Duration = 3
        })
    end
})

-- 添加颜色选择器
TabHandles.Elements:Colorpicker({
    Title = "强调色",
    Desc = "更改UI强调色",
    Default = Color3.fromHex("#6366f1"),
    Callback = function(color)
        WindUI:Notify({
            Title = "颜色已更改",
            Content = "新强调色: "..color:ToHex(),
            Duration = 2
        })
    end
})

-- 外观标签页内容
TabHandles.Appearance:Paragraph({
    Title = "自定义界面",
    Desc = "个性化您的体验",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

-- 主题选择下拉菜单
local themes = { "暗色", "亮色", "蓝色", "红色", "绿色" }
local themeDropdown = TabHandles.Appearance:Dropdown({
    Title = "选择主题",
    Values = themes,
    Value = "暗色",
    Callback = function(theme)
        WindUI:Notify({
            Title = "主题已应用",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
    end
})

-- 透明度滑块
local transparencySlider = TabHandles.Appearance:Slider({
    Title = "窗口透明度",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
    end
})

-- 暗色模式开关
TabHandles.Appearance:Toggle({
    Title = "启用暗色模式",
    Desc = "使用暗色配色方案",
    Value = true,
    Callback = function(state)
        WindUI:Notify({
            Title = "模式已更改",
            Content = state and "暗色模式已启用" or "亮色模式已启用",
            Duration = 2
        })
    end
})

-- 创建新主题按钮
TabHandles.Appearance:Button({
    Title = "创建新主题",
    Icon = "plus",
    Callback = function()
        WindUI:Dialog({
            Title = "创建主题",
            Content = "此功能即将推出！",
            Buttons = {
                {
                    Title = "确定",
                    Variant = "Primary"
                }
            }
        })
    end
})

-- 配置标签页内容
TabHandles.Config:Paragraph({
    Title = "配置管理器",
    Desc = "保存和加载您的设置",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "默认"
local MyPlayerData = {
    name = "玩家1",
    level = 1,
    inventory = { "剑", "盾", "药水" }
}

-- 配置名称输入框
TabHandles.Config:Input({
    Title = "配置名称",
    Value = configName,
    Callback = function(value)
        configName = value
    end
})

-- 保存配置按钮
TabHandles.Config:Button({
    Title = "保存配置",
    Icon = "save",
    Variant = "Primary",
    Callback = function()
        WindUI:Notify({ 
            Title = "配置已保存", 
            Content = "已保存为: "..configName,
            Icon = "check",
            Duration = 3
        })
    end
})

-- 加载配置按钮
TabHandles.Config:Button({
    Title = "加载配置",
    Icon = "folder",
    Callback = function()
        WindUI:Notify({ 
            Title = "配置已加载", 
            Content = "已加载: "..configName,
            Icon = "refresh-cw",
            Duration = 3
        })
        
        TabHandles.Config:Paragraph({
            Title = "玩家数据",
            Desc = string.format("名称: %s\n等级: %d\n库存: %s", 
                MyPlayerData.name, 
                MyPlayerData.level, 
                table.concat(MyPlayerData.inventory, ", "))
        })
    end
})

-- 页脚部分
local footerSection = Window:Section({ Title = "AlienX 2.0" })
TabHandles.Config:Paragraph({
    Title = "由 宇星辰 创建",
    Desc = "被遗弃版本",
    Image = "heart",
    ImageSize = 20,
    Color = "Grey",
})

-- 窗口关闭回调
Window:OnClose(function()
    print("窗口已关闭")
end)

-- 窗口销毁回调
Window:OnDestroy(function()
    print("窗口已销毁")
end)
