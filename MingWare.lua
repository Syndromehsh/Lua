

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- 创建主屏幕GUI
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "WenDing_Full_Loader_WhiteParticles"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- ========================
-- 1. 黑色背景幕布与白色背景粒子
-- ========================
local blackBackground = Instance.new("Frame")
blackBackground.Name = "BlackBackground"
blackBackground.Size = UDim2.new(1, 0, 1, 0)
blackBackground.BackgroundColor3 = Color3.new(0, 0, 0)
blackBackground.BackgroundTransparency = 1
blackBackground.ZIndex = 1
blackBackground.Parent = gui

-- 白色粒子容器
local bgParticleContainer = Instance.new("Frame")
bgParticleContainer.Name = "WhiteParticleContainer"
bgParticleContainer.Size = UDim2.new(1, 0, 1, 0)
bgParticleContainer.BackgroundTransparency = 1
bgParticleContainer.ClipsDescendants = true
bgParticleContainer.ZIndex = 2
bgParticleContainer.Parent = blackBackground

-- 创建白色小粒子
local whiteParticles = {}
local whiteParticleCount = 40 -- 白色粒子数量

for i = 1, whiteParticleCount do
    local particle = Instance.new("Frame")
    particle.Name = "WhiteParticle_"..i
    particle.AnchorPoint = Vector2.new(0.5, 0.5)
    particle.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 纯白色
    particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5)) -- 小尺寸
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundTransparency = 1 -- 初始透明
    particle.ZIndex = 2
    particle.Parent = bgParticleContainer
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    whiteParticles[i] = {
        element = particle,
        xSpeed = (math.random() - 0.5) * 0.15, -- 较慢速度
        ySpeed = (math.random() - 0.5) * 0.15,
        scale = 0.5 + math.random() * 0.5,
        alpha = 0.2 + math.random() * 0.3 -- 半透明效果
    }
end

-- ========================
-- 2. NOL定制字幕动画
-- ========================
local nolText = Instance.new("TextLabel")
nolText.Name = "NOLText"
nolText.AnchorPoint = Vector2.new(0.5, 0.5)
nolText.Position = UDim2.new(0.5, 0, 0.5, 0)
nolText.Size = UDim2.new(0, 0, 0, 80)
nolText.BackgroundTransparency = 1
nolText.Font = Enum.Font.GothamBold
nolText.Text = "NOL PRESENTS"
nolText.TextColor3 = Color3.fromRGB(255, 255, 255) -- 白色文字
nolText.TextSize = 36
nolText.TextTransparency = 1
nolText.TextWrapped = true
nolText.ZIndex = 10
nolText.Parent = gui

-- ========================
-- 3. 主加载UI
-- ========================
local container = Instance.new("Frame")
container.Name = "MainContainer"
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
container.BackgroundTransparency = 1
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.Size = UDim2.new(0, 350, 0, 250)
container.ZIndex = 20
container.Parent = gui

-- 圆角效果
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.08, 0)
uiCorner.Parent = container

-- 边框发光效果
local uiStroke = Instance.new("UIStroke")
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Color = Color3.fromRGB(120, 80, 180)
uiStroke.Transparency = 1
uiStroke.Thickness = 2
uiStroke.Parent = container

-- 主标题
local title = Instance.new("TextLabel")
title.Name = "Title"
title.AnchorPoint = Vector2.new(0.5, 0)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.5, 0, 0.1, 0)
title.Size = UDim2.new(0.8, 0, 0, 60)
title.Font = Enum.Font.SciFi
title.Text = "MingWare"
title.TextColor3 = Color3.fromRGB(180, 140, 255)
title.TextScaled = true
title.TextSize = 28
title.TextStrokeColor3 = Color3.fromRGB(80, 40, 120)
title.TextStrokeTransparency = 1
title.TextTransparency = 1
title.TextWrapped = true
title.ZIndex = 21
title.Parent = container

-- 标题下划线
local underline = Instance.new("Frame")
underline.Name = "Underline"
underline.AnchorPoint = Vector2.new(0.5, 0)
underline.BackgroundColor3 = Color3.fromRGB(150, 100, 220)
underline.BorderSizePixel = 0
underline.Position = UDim2.new(0.5, 0, 0.35, 0)
underline.Size = UDim2.new(0, 0, 0, 2)
underline.ZIndex = 21
underline.Parent = container

-- 前景粒子容器（彩色粒子）
local particleContainer = Instance.new("Frame")
particleContainer.Name = "ParticleContainer"
particleContainer.AnchorPoint = Vector2.new(0.5, 0.5)
particleContainer.BackgroundTransparency = 1
particleContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
particleContainer.Size = UDim2.new(1, 0, 0.5, 0)
particleContainer.ClipsDescendants = true
particleContainer.ZIndex = 21
particleContainer.Parent = container

-- 创建前景彩色粒子
local particles = {}
local particleCount = 18

for i = 1, particleCount do
    local particle = Instance.new("Frame")
    particle.Name = "Particle_"..i
    particle.AnchorPoint = Vector2.new(0.5, 0.5)
    particle.BackgroundColor3 = Color3.fromRGB(
        math.random(160, 200),
        math.random(120, 180),
        math.random(200, 255)
    )
    particle.Size = UDim2.new(0, math.random(4, 8), 0, math.random(4, 8))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundTransparency = 1
    particle.ZIndex = 21
    particle.Parent = particleContainer
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    particles[i] = {
        element = particle,
        xSpeed = (math.random() - 0.5) * 0.4,
        ySpeed = (math.random() - 0.5) * 0.4,
        scale = 0.5 + math.random(),
        alpha = 0.3 + math.random() * 0.7
    }
end

-- 加载进度条背景
local progressBarBg = Instance.new("Frame")
progressBarBg.Name = "ProgressBarBg"
progressBarBg.AnchorPoint = Vector2.new(0.5, 0)
progressBarBg.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
progressBarBg.BackgroundTransparency = 1
progressBarBg.BorderSizePixel = 0
progressBarBg.Position = UDim2.new(0.5, 0, 0.8, 0)
progressBarBg.Size = UDim2.new(0.7, 0, 0, 8)
progressBarBg.ZIndex = 21
progressBarBg.Parent = container

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0.5, 0)
progressCorner.Parent = progressBarBg

-- 加载进度条填充
local progressFill = Instance.new("Frame")
progressFill.Name = "ProgressFill"
progressFill.AnchorPoint = Vector2.new(0, 0.5)
progressFill.BackgroundColor3 = Color3.fromRGB(160, 120, 255)
progressFill.BorderSizePixel = 0
progressFill.Position = UDim2.new(0, 0, 0.5, 0)
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.ZIndex = 22
progressFill.Parent = progressBarBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0.5, 0)
fillCorner.Parent = progressFill

-- 进度条发光效果
local fillGlow = Instance.new("UIStroke")
fillGlow.Color = Color3.fromRGB(200, 180, 255)
fillGlow.Thickness = 1
fillGlow.Transparency = 1
fillGlow.Parent = progressFill

-- 百分比文本
local percentText = Instance.new("TextLabel")
percentText.Name = "PercentText"
percentText.AnchorPoint = Vector2.new(0.5, 0)
percentText.BackgroundTransparency = 1
percentText.Position = UDim2.new(0.5, 0, 0.88, 0)
percentText.Size = UDim2.new(0, 200, 0, 30)
percentText.Font = Enum.Font.SciFi
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(200, 180, 255)
percentText.TextSize = 18
percentText.TextTransparency = 1
percentText.TextWrapped = true
percentText.ZIndex = 21
percentText.Parent = container

-- ========================
-- 4. 动画函数
-- ========================
-- 更新白色背景粒子
local function updateWhiteParticles()
    for i, particle in ipairs(whiteParticles) do
        local currentPos = particle.element.Position
        local newX = (currentPos.X.Scale + particle.xSpeed * 0.016) % 1
        local newY = (currentPos.Y.Scale + particle.ySpeed * 0.016) % 1
        
        particle.element.Position = UDim2.new(newX, 0, newY, 0)
        
        -- 添加轻微的闪烁效果
        local flicker = math.sin(os.clock() * 3 + i) * 0.1
        particle.element.BackgroundTransparency = 1 - (particle.alpha + flicker * 0.1)
    end
end

-- 更新前景彩色粒子
local function updateParticles()
    for i, particle in ipairs(particles) do
        local currentPos = particle.element.Position
        local newX = (currentPos.X.Scale + particle.xSpeed * 0.016) % 1
        local newY = (currentPos.Y.Scale + particle.ySpeed * 0.016) % 1
        
        particle.element.Position = UDim2.new(newX, 0, newY, 0)
        
        local scale = particle.scale + math.sin(os.clock() * 2 + i) * 0.1
        particle.element.Size = UDim2.new(0, 6 * scale, 0, 6 * scale)
        
        particle.element.BackgroundTransparency = 1 - particle.alpha * (0.7 + math.sin(os.clock() * 3 + i) * 0.3)
    end
end

-- 进度条动画
local progress = 0
local loadingComplete = false
local function updateProgress()
    if loadingComplete then return end
    
    progress = progress + 0.003
    if progress >= 1 then
        progress = 1
        loadingComplete = true
    end
    
    progressFill.Size = UDim2.new(progress, 0, 1, 0)
    percentText.Text = string.format("%d%%", math.floor(progress * 100))
    
    fillGlow.Transparency = 0.5 + math.abs(math.sin(os.clock() * 5)) * 0.3
end

-- NOL字幕动画
local function playNOLAnimation()
    -- 黑色背景淡入
    TweenService:Create(
        blackBackground,
        TweenInfo.new(1.2, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 0.7
        }
    ):Play()
    
    -- 白色粒子淡入（更密集的出现）
    for i, particle in ipairs(whiteParticles) do
        task.delay(i * 0.05, function() -- 更快的出现节奏
            TweenService:Create(
                particle.element,
                TweenInfo.new(1.5, Enum.EasingStyle.Quad),
                {
                    BackgroundTransparency = 1 - particle.alpha
                }
            ):Play()
        end)
    end
    
    task.wait(0.8)
    
    -- NOL文字动画
    -- 文字宽度扩展
    local widthTween = TweenService:Create(
        nolText,
        TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 300, 0, 80)
        }
    )
    
    -- 文字淡入
    local fadeTween = TweenService:Create(
        nolText,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad),
        {
            TextTransparency = 0
        }
    )
    
    widthTween:Play()
    fadeTween:Play()
    
    task.wait(1.8)
    
    -- 文字淡出
    local fadeOutTween = TweenService:Create(
        nolText,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad),
        {
            TextTransparency = 1
        }
    )
    
    -- 文字收缩
    local shrinkTween = TweenService:Create(
        nolText,
        TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0, 0, 0, 80)
        }
    )
    
    fadeOutTween:Play()
    shrinkTween:Play()
    
    task.wait(0.8)
    
    -- 主UI淡入
    TweenService:Create(
        container,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 0.2
        }
    ):Play()
    
    -- 边框发光淡入
    TweenService:Create(
        uiStroke,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            Transparency = 0.3
        }
    ):Play()
    
    -- 标题淡入
    TweenService:Create(
        title,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            TextTransparency = 0,
            TextStrokeTransparency = 0.6
        }
    ):Play()
    
    -- 下划线展开
    TweenService:Create(
        underline,
        TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.5, 0, 0, 2)
        }
    ):Play()
    
    -- 进度条背景淡入
    TweenService:Create(
        progressBarBg,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 0
        }
    ):Play()
    
    -- 进度条发光淡入
    TweenService:Create(
        fillGlow,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            Transparency = 0.7
        }
    ):Play()
    
    -- 百分比文本淡入
    TweenService:Create(
        percentText,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            TextTransparency = 0
        }
    ):Play()
    
    -- 前景彩色粒子淡入
    for i, particle in ipairs(particles) do
        task.delay(i * 0.05, function()
            TweenService:Create(
                particle.element,
                TweenInfo.new(0.8, Enum.EasingStyle.Quad),
                {
                    BackgroundTransparency = 1 - particle.alpha
                }
            ):Play()
        end)
    end
    
    -- 背景变暗
    TweenService:Create(
        blackBackground,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 0.85
        }
    ):Play()
end

-- 加载完成动画
local function playCompleteAnimation()
    -- 标题变色
    TweenService:Create(
        title,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            TextColor3 = Color3.fromRGB(220, 180, 255),
            TextStrokeColor3 = Color3.fromRGB(120, 80, 160)
        }
    ):Play()
    
    -- 进度条变色
    TweenService:Create(
        progressFill,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            BackgroundColor3 = Color3.fromRGB(200, 160, 255)
        }
    ):Play()
    
    -- 前景彩色粒子加速并淡出
    for i, particle in ipairs(particles) do
        particle.xSpeed = particle.xSpeed * 3
        particle.ySpeed = particle.ySpeed * 3
        
        TweenService:Create(
            particle.element,
            TweenInfo.new(1, Enum.EasingStyle.Quad),
            {
                BackgroundTransparency = 1
            }
        ):Play()
    end
    
    -- 白色背景粒子淡出
    for i, particle in ipairs(whiteParticles) do
        TweenService:Create(
            particle.element,
            TweenInfo.new(1.5, Enum.EasingStyle.Quad),
            {
                BackgroundTransparency = 1
            }
        ):Play()
    end
    
    -- 移除NOL文字
    nolText:Destroy()
    
    task.wait(1.2)
    
    -- 主UI淡出
    TweenService:Create(
        container,
        TweenInfo.new(1, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 1
        }
    ):Play()
    
    -- 背景淡出
    TweenService:Create(
        blackBackground,
        TweenInfo.new(1.5, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 1
        }
    ):Play()
    
    -- 延迟后销毁GUI
    task.wait(1.5)
    gui:Destroy()
end

-- ========================
-- 5. 主循环
-- ========================
-- 启动NOL动画
playNOLAnimation()

-- 主渲染循环
local renderConnection
renderConnection = RunService.RenderStepped:Connect(function(deltaTime)
    updateWhiteParticles()
    updateParticles()
    updateProgress()
end)

-- 模拟加载过程
while not loadingComplete do
    task.wait(0.05)
end

-- 加载完成
playCompleteAnimation()
