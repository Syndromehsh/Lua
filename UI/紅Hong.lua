local a = {
	Plrs = "Players",
	LP = "LocalPlayer",
	RS = "ReplicatedStorage"
}
local b = setmetatable({}, {
	__index = function(self, c)
		return game.GetService(game, c)
	end,
	__call = function(self, c)
		return game.GetService(game, c)
	end
})
if b.CoreGui:FindFirstChild(_CONFIGS.UI_NAME) then
	b.CoreGui[_CONFIGS.UI_NAME]:Destroy()
end
local dm = UDim.new
local dn = UDim2.new
local dp = Color3.fromRGB
local dq = Instance.new
local dr = function() end
local ds = b.Players.LocalPlayer:GetMouse()


local THEME = {}

THEME.SURFACE = {
	WINDOW   = dp(242, 244, 247),
	TITLEBAR = dp(234, 237, 242),
	SIDEBAR  = dp(234, 237, 242),
	PANEL    = dp(242, 244, 247),
	CARD     = dp(234, 237, 242),
	CARD_ALT = dp(236, 239, 244),
}

THEME.TEXTS = {
	PRIMARY     = dp(28, 30, 33),
	SECONDARY   = dp(105, 110, 120),
	PLACEHOLDER = dp(130, 135, 145),
	INVERT      = dp(255, 255, 255)
}

THEME.BORDERS = {
	SOFT   = dp(214, 219, 228),
	MEDIUM = dp(204, 210, 220),
	HARD   = dp(186, 192, 205),
}

THEME.CONTROL = {
	INPUT_BG        = dp(225, 229, 236),
	INPUT_BG_FOCUS  = dp(220, 224, 232),
	DROPDOWN_BG      = dp(242, 244, 247),
	DROPDOWN_ITEM_BG = dp(234, 237, 242),
	SLIDER_BAR_BG = dp(206, 212, 222),
	SLIDER_FILL   = dp(56, 126, 226),
	TOGGLE_OFF_START = dp(229, 231, 235),
	TOGGLE_OFF_END   = dp(209, 213, 219),
	TOGGLE_ON_START  = dp(52, 199, 89),
	TOGGLE_ON_END    = dp(48, 209, 88),
	ICON_PRIMARY = dp(28, 30, 33),
	ICON_MUTED   = dp(105, 110, 120),
}

THEME.STATE = {
	ACCENT  = dp(56, 126, 226),
	SUCCESS = dp(46, 160, 85),
	DANGER  = dp(214, 73, 60),
	WARNING = dp(245, 190, 75),
}

THEME.GLOW = {
	START = dp(176, 180, 190),
	MID   = dp(140, 146, 156),
	END   = dp(176, 180, 190),
}

THEME.SCROLLBAR = {
	TRACK = dp(234, 237, 242),
	THUMB = dp(206, 212, 222),
}

THEME.ALPHA = {
	STROKE_CONTAINER = 0.45,
	STROKE_CARD      = 0.55,
	STROKE_INPUT     = 0.65,
}

THEME.WHITE   = THEME.SURFACE.CARD
THEME.SHEET   = THEME.SURFACE.TITLEBAR
THEME.INPUT   = THEME.CONTROL.INPUT_BG
THEME.BAR     = THEME.CONTROL.SLIDER_BAR_BG
THEME.TEXT    = THEME.TEXTS.PRIMARY
THEME.SUBTEXT = THEME.TEXTS.SECONDARY
THEME.BORDER  = THEME.BORDERS.MEDIUM
THEME.ACCENT  = THEME.STATE.ACCENT
THEME.GOOD    = THEME.STATE.SUCCESS
THEME.BAD     = THEME.STATE.DANGER
THEME.GL1     = THEME.GLOW.START
THEME.GL2     = THEME.GLOW.MID
THEME.MAIN    = THEME.SURFACE.WINDOW
THEME.SECTION = THEME.SURFACE.CARD

local R = {
	big = dm(0,12),
	mid = dm(0,10),
	small = dm(0,8),
	tiny = dm(0,4),
	micro = dm(0,2),
}

getgenv().library = {
	flags = {
		GetState = function(dt, du)
			return library.flags[du].State
		end
	},
	modules = {},
	currentTab = nil
}
function library:UpdateToggle(du, be)
	local be = be or library.flags:GetState(du)
	if be == library.flags:GetState(du) then
		return
	end
	library.flags[du]:SetState(be)
end
local dv = {}
function dv:Tween(dw, dx, dy, dz, dA)
	return b.TweenService:Create(
		dx, TweenInfo.new(dy or 0.25, Enum.EasingStyle[dz or "Linear"], Enum.EasingDirection[dA or "InOut"]), dw)
end
function dv:SwitchTab(dB)
	local dC = library.currentTab
	if dC == dB then return end
	library.currentTab = dB
	dv:Tween({ Transparency = 1 }, dC[2].Glow):Play()
	dv:Tween({ Transparency = 0 }, dB[2].Glow):Play()
	dC[1].Visible = false
	dB[1].Visible = true
end

local dD = dq("ScreenGui")
local Open = dq("TextButton")
local dE = dq("Frame")
local dF = dq("UICorner")
local dG = dq("TextLabel")
local dH = dq("UICorner")
local dI = dq("Frame")
local dJ = dq("UICorner")
local dK = dq("ScrollingFrame")
local dL = dq("UIListLayout")
local dM = dq("UIPadding")
local dN = dq("Frame")
local dO = dq("UICorner")

dD.Name = _CONFIGS.UI_NAME
dD.Parent = b.CoreGui

dE.Name = "Main"
dE.Parent = dD
dE.BackgroundColor3 = THEME.MAIN
dE.BorderSizePixel = 0
dE.Position = dn(0.5, 0, 0.5, 0)
dE.Size = dn(0, 448, 0, 280)
dE.AnchorPoint = Vector2.new(0.5, 0.5)
dE.Active = true
dE.Draggable = true

dF.CornerRadius = R.big
dF.Name = "MainCorner"
dF.Parent = dE

dG.Parent = dE
dG.BackgroundColor3 = THEME.SURFACE.TITLEBAR
dG.BorderSizePixel = 0
dG.Position = dn(0, 6, 0, 6)
dG.Size = dn(0, 436, 0, 24)
dG.Font = Enum.Font.GothamBold
dG.Text = "  " .. _CONFIGS.UI_NAME
dG.TextColor3 = THEME.TEXT
dG.TextSize = 14.000
dG.TextXAlignment = Enum.TextXAlignment.Left

Open.Name = "Open"
Open.Parent = dD
Open.BackgroundColor3 = dE.BackgroundColor3
Open.Position = UDim2.new(0.839879155, 0, -0.0123076923, 0)
Open.BorderSizePixel = 2
Open.BorderColor3 = THEME.BORDER
Open.Size = UDim2.new(0, 55, 0, 25)
Open.Font = Enum.Font.SourceSans
Open.Text = "隐藏"
Open.TextColor3 = THEME.TEXT
Open.TextSize = 14.000
Open.Active = true
Open.Draggable = true

local TOGGLE = true
Open.MouseButton1Down:connect(function()
	TOGGLE = not TOGGLE
	dE.Visible = TOGGLE
	Open.Text = (TOGGLE and "隐藏" or "打开")
end)

dH.CornerRadius = R.big
dH.Name = "TextLabelCorner"
dH.Parent = dG

dI.Name = "Sidebar"
dI.Parent = dE
dI.BackgroundColor3 = THEME.SURFACE.SIDEBAR
dI.BorderSizePixel = 0
dI.Position = dn(0, 6, 0, 36)
dI.Size = dn(0, 106, 0, 238)

dJ.CornerRadius = R.big
dJ.Name = "SidebarCorner"
dJ.Parent = dI

dK.Name = "TabButtons"
dK.Parent = dI
dK.Active = true
dK.BackgroundColor3 = THEME.MAIN
dK.BackgroundTransparency = 1.000
dK.BorderSizePixel = 0
dK.Size = dn(0, 106, 0, 238)
dK.ScrollBarThickness = 0

dL.Parent = dK
dL.HorizontalAlignment = Enum.HorizontalAlignment.Center
dL.SortOrder = Enum.SortOrder.LayoutOrder
dL.Padding = dm(0, 5)

dM.Parent = dK
dM.PaddingTop = dm(0, 6)

dN.Name = "TabHolder"
dN.Parent = dE
dN.BackgroundColor3 = THEME.SURFACE.PANEL
dN.BorderSizePixel = 0
dN.Position = dn(0, 118, 0, 36)
dN.Size = dn(0, 324, 0, 238)

dO.CornerRadius = R.big
dO.Name = "TabHolderCorner"
dO.Parent = dN

dL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	dK.CanvasSize = dn(0, 0, 0, dL.AbsoluteContentSize.Y + 12)
end)

function createBaseNotifications()
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationHolder") then
		return game:GetService("Players").LocalPlayer.PlayerGui.NotificationHolder
	end
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local ToggleNotif = Instance.new("Frame")
	ToggleNotif.Name = "ToggleNotif"
	ToggleNotif.ZIndex = 5
	ToggleNotif.AnchorPoint = Vector2.new(1, 1)
	ToggleNotif.Visible = false
	ToggleNotif.Size = UDim2.new(0, 291, 0, 56)
	ToggleNotif.Position = UDim2.new(1, 0, 1, 0)
	ToggleNotif.BackgroundColor3 = THEME.SECTION
	ToggleNotif.Parent = ScreenGui

	local UiCorner = Instance.new("UICorner")
	UiCorner.Name = "UiCorner"
	UiCorner.CornerRadius = R.big
	UiCorner.Parent = ToggleNotif

	local Dropshadow = Instance.new("UIStroke")
	Dropshadow.Name = "Dropshadow"
	Dropshadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Dropshadow.Transparency = 0.4
	Dropshadow.Thickness = 1
	Dropshadow.Color = THEME.BORDER
	Dropshadow.Parent = ToggleNotif

	local SepVertical = Instance.new("Frame")
	SepVertical.Name = "SepVertical"
	SepVertical.Size = UDim2.new(0, 2, 0, 56)
	SepVertical.BackgroundTransparency = 0.5
	SepVertical.Position = UDim2.new(0.7423077, 0, 0, 0)
	SepVertical.BorderSizePixel = 0
	SepVertical.BackgroundColor3 = THEME.BORDER
	SepVertical.Parent = ToggleNotif

	local SepHorizontal = Instance.new("Frame")
	SepHorizontal.Name = "SepHorizontal"
	SepHorizontal.Size = UDim2.new(0, 72, 0, 2)
	SepHorizontal.BackgroundTransparency = 0.5
	SepHorizontal.Position = UDim2.new(0.75, 0, 0.4464286, 2)
	SepHorizontal.BorderSizePixel = 0
	SepHorizontal.BackgroundColor3 = THEME.BORDER
	SepHorizontal.Parent = ToggleNotif

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Size = UDim2.new(0, 216, 0, 19)
	Title.BackgroundTransparency = 1
	Title.BorderSizePixel = 0
	Title.BackgroundColor3 = THEME.SECTION
	Title.FontSize = Enum.FontSize.Size14
	Title.TextSize = 14
	Title.TextColor3 = THEME.TEXT
	Title.Font = Enum.Font.SourceSans
	Title.Parent = ToggleNotif

	local Paragraph = Instance.new("TextLabel")
	Paragraph.Name = "Paragraph"
	Paragraph.Size = UDim2.new(0, 218, 0, 37)
	Paragraph.BackgroundTransparency = 1
	Paragraph.Position = UDim2.new(0, 0, 0.3392857, 0)
	Paragraph.BackgroundColor3 = THEME.SECTION
	Paragraph.FontSize = Enum.FontSize.Size14
	Paragraph.TextSize = 14
	Paragraph.TextColor3 = THEME.TEXT
	Paragraph.Text = ""
	Paragraph.TextYAlignment = Enum.TextYAlignment.Top
	Paragraph.TextWrapped = true
	Paragraph.Font = Enum.Font.SourceSans
	Paragraph.TextWrap = true
	Paragraph.TextXAlignment = Enum.TextXAlignment.Left
	Paragraph.Parent = ToggleNotif

	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingLeft = UDim.new(0, 10)
	UIPadding.PaddingRight = UDim.new(0, 5)
	UIPadding.Parent = Paragraph

	local True = Instance.new("TextButton")
	True.Name = "True"
	True.Size = UDim2.new(0, 72, 0, 27)
	True.BackgroundTransparency = 1
	True.Position = UDim2.new(0.75, 0, 0, 0)
	True.BorderSizePixel = 0
	True.BackgroundColor3 = THEME.SECTION
	True.FontSize = Enum.FontSize.Size14
	True.TextSize = 14
	True.TextColor3 = THEME.ACCENT
	True.Text = "Yes"
	True.Font = Enum.Font.SourceSans
	True.Parent = ToggleNotif

	local False = Instance.new("TextButton")
	False.Name = "False"
	False.Size = UDim2.new(0, 72, 0, 27)
	False.BackgroundTransparency = 1
	False.Position = UDim2.new(0.75, 0, 0.5178571, 0)
	False.BorderSizePixel = 0
	False.BackgroundColor3 = THEME.SECTION
	False.FontSize = Enum.FontSize.Size14
	False.TextSize = 14
	False.TextColor3 = THEME.BAD
	False.Text = "No"
	False.Font = Enum.Font.SourceSans
	False.Parent = ToggleNotif

	local LocalScript = Instance.new("LocalScript")
	LocalScript.Parent = ScreenGui

	local DefaultNotif = Instance.new("Frame")
	DefaultNotif.Name = "DefaultNotif"
	DefaultNotif.ZIndex = 5
	DefaultNotif.AnchorPoint = Vector2.new(1, 1)
	DefaultNotif.Visible = false
	DefaultNotif.Size = UDim2.new(0, 291, 0, 56)
	DefaultNotif.Position = UDim2.new(1, 0, 0.9999999, 0)
	DefaultNotif.BackgroundColor3 = THEME.SECTION
	DefaultNotif.Parent = ScreenGui

	local UiCorner1 = Instance.new("UICorner")
	UiCorner1.Name = "UiCorner"
	UiCorner1.CornerRadius = R.big
	UiCorner1.Parent = DefaultNotif

	local Dropshadow1 = Instance.new("UIStroke")
	Dropshadow1.Name = "Dropshadow"
	Dropshadow1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Dropshadow1.Transparency = 0.4
	Dropshadow1.Thickness = 1
	Dropshadow1.Color = THEME.BORDER
	Dropshadow1.Parent = DefaultNotif

	local Title1 = Instance.new("TextLabel")
	Title1.Name = "Title"
	Title1.Size = UDim2.new(0, 291, 0, 19)
	Title1.BackgroundTransparency = 1
	Title1.BorderSizePixel = 0
	Title1.BackgroundColor3 = THEME.SECTION
	Title1.FontSize = Enum.FontSize.Size14
	Title1.TextSize = 14
	Title1.TextColor3 = THEME.TEXT
	Title1.Font = Enum.Font.SourceSans
	Title1.Parent = DefaultNotif

	local Paragraph1 = Instance.new("TextLabel")
	Paragraph1.Name = "Paragraph"
	Paragraph1.Size = UDim2.new(0, 291, 0, 37)
	Paragraph1.BackgroundTransparency = 1
	Paragraph1.Position = UDim2.new(0, 0, 0.3392857, 0)
	Paragraph1.BackgroundColor3 = THEME.SECTION
	Paragraph1.FontSize = Enum.FontSize.Size14
	Paragraph1.TextSize = 14
	Paragraph1.TextColor3 = THEME.TEXT
	Paragraph1.Text = ""
	Paragraph1.TextYAlignment = Enum.TextYAlignment.Top
	Paragraph1.TextWrapped = true
	Paragraph1.Font = Enum.Font.SourceSans
	Paragraph1.TextWrap = true
	Paragraph1.TextXAlignment = Enum.TextXAlignment.Left
	Paragraph1.Parent = DefaultNotif

	local UIPadding1 = Instance.new("UIPadding")
	UIPadding1.PaddingLeft = UDim.new(0, 10)
	UIPadding1.PaddingRight = UDim.new(0, 5)
	UIPadding1.Parent = Paragraph1

	if syn then
		syn.protect_gui(ScreenGui)
	end
	ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
	return ScreenGui
end
notificationHolder = createBaseNotifications()
notifAmount = 0
removedPos = nil

function library:SelectNotify(args)
	args = args or {}
	args.TweenSpeed = args.TweenSpeed or 1
	args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
	args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
	args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
	args.Title = args.Title or "Title"
	args.Text = args.Text or "Text"
	args.TrueText = args.TrueText or "Yes"
	args.FalseText = args.FalseText or "No"
	args.Duration = args.Duration or 5
	args.Callback = args.Callback or function() warn("No callback for notif") end

	notifAmount = notifAmount + 1
	local track = notifAmount
	local notifNum = notifAmount
	local doesExist = true
	local notif = notificationHolder.ToggleNotif:Clone()
	local removed = false
	notif.Parent = notificationHolder
	notif.Visible = true
	notif.Position = UDim2.new(1, 300, 1, -5)
	notif.Transparency = 0.05
	notif.True.Text = args.TrueText
	notif.False.Text = args.FalseText
	task.spawn(function()
		task.wait(args.Duration + args.TweenInSpeed)
		doesExist = false
	end)
	notif.True.MouseButton1Click:Connect(function()
		doesExist = false
		removed = true
		notifAmount = notifAmount - 1
		removedPos = notif.Position.Y.Offset
		pcall(args.Callback, true)
	end)
	notif.False.MouseButton1Click:Connect(function()
		doesExist = false
		removed = true
		notifAmount = notifAmount - 1
		removedPos = notif.Position.Y.Offset
		pcall(args.Callback, false)
	end)
	notif.Paragraph.Text = args.Text
	notif.Title.Text = args.Title
	notif:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
	task.spawn(function()
		local originalPos = notif.Position
		while doesExist and task.wait() do
			local pos = notif.Position
			if notifAmount > track then
				notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				track = track + 1
			end
			if notifAmount < track then
				if removedPos > pos.Y.Offset then
					notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				else
					notifNum = notifNum - 1
				end
				track = track - 1
			end
		end
		local pos = notif.Position
		if removed == false then
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
		notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
		task.wait(args.TweenOutSpeed)
		notif:Destroy()
	end)
end

function library:Notify(args)
	args = args or {}
	args.TweenSpeed = args.TweenSpeed or 1
	args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
	args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
	args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
	args.Title = args.Title or "Title"
	args.Text = args.Text or "Text"
	args.Duration = args.Duration or 5

	notifAmount = notifAmount + 1
	local track = notifAmount
	local notifNum = notifAmount
	local removed = false
	local doesExist = true
	local notif = notificationHolder.DefaultNotif:Clone()
	notif.Parent = notificationHolder
	notif.Visible = true
	notif.Position = UDim2.new(1, 300, 1, -5)
	notif.Transparency = 0.05
	notif.InputBegan:Connect(function(InputObject)
		if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			task.spawn(function()
				local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
				game:GetService("TweenService"):Create(notif, tweenInfo, { Transparency = 0.8 }):Play()
			end)
			doesExist = false
			removed = true
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
	end)
	task.spawn(function()
		task.wait(args.Duration + args.TweenInSpeed)
		doesExist = false
	end)
	notif.Paragraph.Text = args.Text
	notif.Title.Text = args.Title
	notif:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
	task.spawn(function()
		local originalPos = notif.Position
		while doesExist and task.wait() do
			local pos = notif.Position
			if notifAmount > track then
				notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				track = track + 1
			end
			if notifAmount < track then
				if removedPos > pos.Y.Offset then
					notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				else
					notifNum = notifNum - 1
				end
				track = track - 1
			end
		end
		local pos = notif.Position
		if removed == false then
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
		notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
		task.wait(args.TweenOutSpeed)
		notif:Destroy()
	end)
end

function library:CreateTab(dZ)
	local d_ = dq("TextButton")
	local e0 = dq("UICorner")
	local e1 = dq("Frame")
	local e2 = dq("UICorner")
	local e3 = dq("UIGradient")
	local e4 = dq("ScrollingFrame")
	local e5 = dq("UIPadding")
	local e6 = dq("UIListLayout")

	d_.Name = "TabButton"
	d_.Parent = dK
	d_.BackgroundColor3 = THEME.SECTION
	d_.BorderSizePixel = 0
	d_.Size = dn(0, 94, 0, 28)
	d_.AutoButtonColor = false
	d_.Font = Enum.Font.GothamSemibold
	d_.Text = dZ
	d_.TextColor3 = THEME.TEXT
	d_.TextSize = 14.000

	e0.CornerRadius = R.big
	e0.Name = "TabButtonCorner"
	e0.Parent = d_

	e1.Name = "Glow"
	e1.Parent = d_
	e1.BackgroundColor3 = THEME.SECTION
	e1.BorderSizePixel = 0
	e1.Position = dn(0, 0, 0.928571463, 0)
	e1.Size = dn(0, 94, 0, 2)
	e1.Transparency = 1

	e2.CornerRadius = R.big
	e2.Name = "GlowCorner"
	e2.Parent = e1

	e3.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, THEME.GL1),
		ColorSequenceKeypoint.new(0.50, THEME.GL2),
		ColorSequenceKeypoint.new(1.00, THEME.GL1)
	}
	e3.Name = "GlowGradient"
	e3.Parent = e1

	e4.Name = "Tab"
	e4.Parent = dN
	e4.Active = true
	e4.BackgroundColor3 = THEME.SURFACE.PANEL
	e4.BackgroundTransparency = 1.000
	e4.BorderSizePixel = 0
	e4.Size = dn(0, 324, 0, 238)
	e4.ScrollBarThickness = 0
	e4.Visible = false

	if library.currentTab == nil then
		library.currentTab = { e4, d_ }
		e1.Transparency = 0
		e4.Visible = true
	end

	e5.Name = "TabPadding"
	e5.Parent = e4
	e5.PaddingTop = dm(0, 6)

	e6.Name = "TabLayout"
	e6.Parent = e4
	e6.HorizontalAlignment = Enum.HorizontalAlignment.Center
	e6.SortOrder = Enum.SortOrder.LayoutOrder
	e6.Padding = dm(0, 5)
	e6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		e4.CanvasSize = dn(0, 0, 0, e6.AbsoluteContentSize.Y + 12)
	end)

	d_.MouseButton1Click:Connect(function()
		dv:SwitchTab({ e4, d_ })
	end)

	local e7 = {}

	function e7:NewSeparator()
		local e8 = dq("Frame")
		e8.Transparency = 1
		e8.Size = dn(0, 0, 0, 0)
		e8.BorderSizePixel = 0
		e8.Parent = e4
	end

	function e7:NewButton(e9, ea)
		local ea = ea or dr
		local eb = dq("TextButton")
		local ec = dq("UICorner")
		eb.Name = "BtnModule"
		eb.Parent = e4
		eb.BackgroundColor3 = THEME.SECTION
		eb.BorderSizePixel = 0
		eb.Size = dn(0, 312, 0, 28)
		eb.AutoButtonColor = false
		eb.Font = Enum.Font.GothamSemibold
		eb.Text = "  " .. e9
		eb.TextColor3 = THEME.TEXT
		eb.TextSize = 14.000
		eb.TextXAlignment = Enum.TextXAlignment.Left
		ec.CornerRadius = R.big
		ec.Name = "BtnModuleCorner"
		ec.Parent = eb
		eb.MouseButton1Click:Connect(ea)
	end

	function e7:NewToggle(e9, du, ed, ea)
		local ea = ea or dr
		local ed = ed or false
		local ee = dq("TextButton")
		local ef = dq("UICorner")
		local eg = dq("Frame")
		local eh = dq("UIGradient")
		local ei = dq("UICorner")
		local ej = dq("Frame")
		local ek = dq("UICorner")
		local el = dq("UIGradient")

		library.flags[du or e9] = {
			State = false,
			Callback = ea,
			SetState = function(self, be)
				local be = be ~= nil and be or not library.flags:GetState(du)
				library.flags[du].State = be
				task.spawn(function() library.flags[du].Callback(be) end)
				dv:Tween({ Transparency = be and 1 or 0 }, eg):Play()
				dv:Tween({ Transparency = be and 0 or 1 }, ej):Play()
			end
		}

		ee.Name = "ToggleModule"
		ee.Parent = e4
		ee.BackgroundColor3 = THEME.SECTION
		ee.BorderSizePixel = 0
		ee.Size = dn(0, 312, 0, 28)
		ee.AutoButtonColor = false
		ee.Font = Enum.Font.GothamSemibold
		ee.Text = "  " .. e9
		ee.TextColor3 = THEME.TEXT
		ee.TextSize = 14.000
		ee.TextXAlignment = Enum.TextXAlignment.Left

		ef.CornerRadius = R.big
		ef.Name = "ToggleModuleCorner"
		ef.Parent = ee

		eg.Name = "OffStatus"
		eg.Parent = ee
		eg.BackgroundColor3 = THEME.SECTION
		eg.BorderSizePixel = 0
		eg.Position = dn(0.878205061, 0, 0.178571433, 0)
		eg.Size = dn(0, 34, 0, 18)
		eh.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, THEME.CONTROL.TOGGLE_OFF_START),
			ColorSequenceKeypoint.new(0.50, THEME.CONTROL.TOGGLE_OFF_START),
			ColorSequenceKeypoint.new(1.00, THEME.CONTROL.TOGGLE_OFF_END)
		}
		eh.Rotation = 0
		eh.Name = "OffGrad"
		eh.Parent = eg
		ei.CornerRadius = R.small
		ei.Name = "OffStatusCorner"
		ei.Parent = eg

		ej.Name = "OnStatus"
		ej.Parent = ee
		ej.BackgroundColor3 = THEME.SECTION
		ej.BackgroundTransparency = 1.000
		ej.BorderSizePixel = 0
		ej.Position = dn(0.878205121, 0, 0.178571433, 0)
		ej.Size = dn(0, 34, 0, 18)
		ej.Transparency = 1
		ek.CornerRadius = R.small
		ek.Name = "OnStatusCorner"
		ek.Parent = ej
		el.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, THEME.CONTROL.TOGGLE_ON_START),
			ColorSequenceKeypoint.new(1.00, THEME.CONTROL.TOGGLE_ON_END)
		}
		el.Rotation = 0
		el.Name = "OnGrad"
		el.Parent = ej

		ee.MouseButton1Click:Connect(function()
			library.flags[du or e9]:SetState()
		end)
		if ed then
			library.flags[du or e9]:SetState(ed)
		end
	end

	function e7:NewBind(e9, em, ea)
		local em = Enum.KeyCode[em]
		local en = { Return=true, Space=true, Tab=true, Backquote=true, CapsLock=true, Escape=true, Unknown=true }
		local eo = {
			RightControl="Right Ctrl", LeftControl="Left Ctrl", LeftShift="Left Shift", RightShift="Right Shift",
			Semicolon=";", Quote='"', LeftBracket="[", RightBracket="]", Equals="=", Minus="-",
			RightAlt="Right Alt", LeftAlt="Left Alt"
		}
		local ep = em
		local eq = em and (eo[em.Name] or em.Name) or "None"
		local er = dq("TextButton")
		local es = dq("UICorner")
		local et = dq("TextButton")
		local eu = dq("UICorner")

		er.Name = "KeybindModule"
		er.Parent = e4
		er.BackgroundColor3 = THEME.SECTION
		er.BorderSizePixel = 0
		er.Size = dn(0, 312, 0, 28)
		er.AutoButtonColor = false
		er.Font = Enum.Font.GothamSemibold
		er.Text = "  " .. e9
		er.TextColor3 = THEME.TEXT
		er.TextSize = 14.000
		er.TextXAlignment = Enum.TextXAlignment.Left

		es.CornerRadius = R.big
		es.Name = "KeybindModuleCorner"
		es.Parent = er

		et.Name = "KeybindValue"
		et.Parent = er
		et.BackgroundColor3 = THEME.CONTROL.INPUT_BG
		et.BorderSizePixel = 0
		et.Position = dn(0.75, 0, 0.178571433, 0)
		et.Size = dn(0, 74, 0, 18)
		et.AutoButtonColor = false
		et.Font = Enum.Font.Gotham
		et.Text = eq
		et.TextColor3 = THEME.TEXT
		et.TextSize = 12.000

		eu.CornerRadius = R.small
		eu.Name = "KeybindValueCorner"
		eu.Parent = et

		b.UserInputService.InputBegan:Connect(function(aJ, aK)
			if aK then return end
			if aJ.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if aJ.KeyCode ~= ep then return end
			ea(ep.Name)
		end)
		et.MouseButton1Click:Connect(function()
			et.Text = "..."
			wait()
			local ev, ew = b.UserInputService.InputEnded:Wait()
			local ex = tostring(ev.KeyCode.Name)
			if ev.UserInputType ~= Enum.UserInputType.Keyboard then
				et.Text = eq
				return
			end
			if en[ex] then
				et.Text = eq
				return
			end
			wait()
			ep = Enum.KeyCode[ex]
			et.Text = eo[ex] or ex
		end)
	end

	function e7:NewSlider(e9, du, em, ey, ez, eA, ea)
		local em = em or ey
		local ea = ea or dr
		local eB = dq("TextButton")
		local eC = dq("UICorner")
		local eD = dq("Frame")
		local eE = dq("UICorner")
		local eF = dq("Frame")
		local eG = dq("UICorner")
		local eH = dq("TextBox")
		local eI = dq("UICorner")
		local eJ = dq("TextButton")
		local eK = dq("TextButton")

		library.flags[du] = {
			State = em,
			SetValue = function(self, be)
				local eL = (ds.X - eD.AbsolutePosition.X) / eD.AbsoluteSize.X
				if be then eL = (be - ey) / (ez - ey) end
				eL = math.clamp(eL, 0, 1)
				if eA then
					be = be or tonumber(string.format("%.1f", tostring(ey + (ez - ey) * eL)))
				else
					be = be or math.floor(ey + (ez - ey) * eL)
				end
				library.flags[du].State = tonumber(be)
				eH.Text = tostring(be)
				eF.Size = dn(eL, 0, 1, 0)
				ea(tonumber(be))
			end
		}

		eB.Name = "SliderModule"
		eB.Parent = e4
		eB.BackgroundColor3 = THEME.SECTION
		eB.BorderSizePixel = 0
		eB.Position = dn(0, 0, -0.140425533, 0)
		eB.Size = dn(0, 312, 0, 28)
		eB.AutoButtonColor = false
		eB.Font = Enum.Font.GothamSemibold
		eB.Text = "  " .. e9
		eB.TextColor3 = THEME.TEXT
		eB.TextSize = 14.000
		eB.TextXAlignment = Enum.TextXAlignment.Left

		eC.CornerRadius = R.big
		eC.Name = "SliderModuleCorner"
		eC.Parent = eB

		eD.Name = "SliderBar"
		eD.Parent = eB
		eD.BackgroundColor3 = THEME.BAR
		eD.BorderSizePixel = 0
		eD.Position = dn(0.442307681, 0, 0.392857134, 0)
		eD.Size = dn(0, 108, 0, 6)

		eE.CornerRadius = R.small
		eE.Name = "SliderBarCorner"
		eE.Parent = eD

		eF.Name = "SliderPart"
		eF.Parent = eD
		eF.BackgroundColor3 = THEME.ACCENT
		eF.BorderSizePixel = 0
		eF.Size = dn(0, 0, 0, 6)

		eG.CornerRadius = R.small
		eG.Name = "SliderPartCorner"
		eG.Parent = eF

		eH.Name = "SliderValue"
		eH.Parent = eB
		eH.BackgroundColor3 = THEME.INPUT
		eH.BorderSizePixel = 0
		eH.Position = dn(0.884615362, 0, 0.178571433, 0)
		eH.Size = dn(0, 32, 0, 18)
		eH.Font = Enum.Font.Gotham
		eH.Text = em or ey
		eH.TextColor3 = THEME.TEXT
		eH.TextSize = 12.000

		eI.CornerRadius = R.small
		eI.Name = "SliderValueCorner"
		eI.Parent = eH

		eJ.Name = "AddSlider"
		eJ.Parent = eB
		eJ.BackgroundTransparency = 1.000
		eJ.BorderSizePixel = 0
		eJ.Position = dn(0.807692289, 0, 0.178571433, 0)
		eJ.Size = dn(0, 18, 0, 18)
		eJ.Font = Enum.Font.Gotham
		eJ.Text = "+"
		eJ.TextColor3 = THEME.TEXT
		eJ.TextSize = 18.000

		eK.Name = "MinusSlider"
		eK.Parent = eB
		eK.BackgroundTransparency = 1.000
		eK.BorderSizePixel = 0
		eK.Position = dn(0.365384609, 0, 0.178571433, 0)
		eK.Size = dn(0, 18, 0, 18)
		eK.Font = Enum.Font.Gotham
		eK.Text = "-"
		eK.TextColor3 = THEME.TEXT
		eK.TextSize = 18.000

		eK.MouseButton1Click:Connect(function()
			local eM = library.flags:GetState(du)
			eM = math.clamp(eM - 1, ey, ez)
			library.flags[du]:SetValue(eM)
		end)
		eJ.MouseButton1Click:Connect(function()
			local eM = library.flags:GetState(du)
			eM = math.clamp(eM + 1, ey, ez)
			library.flags[du]:SetValue(eM)
		end)

		library.flags[du]:SetValue(em)

		local dS, eN, eO = false, false, { [""] = true, ["-"] = true }
		eD.InputBegan:Connect(function(dX)
			if dX.UserInputType == Enum.UserInputType.MouseButton1 or dX.UserInputType == Enum.UserInputType.Touch then
				library.flags[du]:SetValue()
				dS = true
			end
		end)
		b.UserInputService.InputEnded:Connect(function(dX)
			if dS and (dX.UserInputType == Enum.UserInputType.MouseButton1 or dX.UserInputType == Enum.UserInputType.Touch) then
				dS = false
			end
		end)
		b.UserInputService.InputChanged:Connect(function(dX)
			if dS == true then
				library.flags[du]:SetValue()
			end
		end)
		eH.Focused:Connect(function()
			eN = true
		end)
		eH.FocusLost:Connect(function()
			eN = false
			if eH.Text == "" then
				library.flags[du]:SetValue(em)
			end
		end)
		eH:GetPropertyChangedSignal("Text"):Connect(function()
			if not eN then return end
			eH.Text = eH.Text:gsub("%D+", "")
			local val = eH.Text
			if not tonumber(val) then
				eH.Text = eH.Text:gsub("%D+", "")
			elseif not eO[val] then
				if tonumber(val) > ez then
					val = ez
					eH.Text = tostring(ez)
				end
				library.flags[du]:SetValue(tonumber(val))
			end
		end)
	end

	function e7:NewDropdown(e9, du, eP, ea)
		local ea = ea or dr
		library.flags[du] = { State = eP[1] }

		local eQ = dq("TextButton")
		local eR = dq("UICorner")
		local eS = dq("TextBox")
		local eT = dq("TextButton")
		local eU = dq("TextButton")
		local eV = dq("UICorner")
		local eW = dq("UIListLayout")
		local eX = dq("UIPadding")

		eQ.Name = "DropdownModule"
		eQ.Parent = e4
		eQ.BackgroundColor3 = THEME.SECTION
		eQ.BorderSizePixel = 0
		eQ.Size = dn(0, 312, 0, 28)
		eQ.AutoButtonColor = false
		eQ.Font = Enum.Font.GothamSemibold
		eQ.Text = ""
		eQ.TextColor3 = THEME.TEXT
		eQ.TextSize = 14.000
		eQ.TextXAlignment = Enum.TextXAlignment.Left

		eR.CornerRadius = R.big
		eR.Name = "DropdownModuleCorner"
		eR.Parent = eQ

		eS.Name = "DropdownText"
		eS.Parent = eQ
		eS.BackgroundColor3 = THEME.SECTION
		eS.BackgroundTransparency = 1.000
		eS.Position = dn(0.025641026, 0, 0, 0)
		eS.Size = dn(0, 192, 0, 28)
		eS.Font = Enum.Font.GothamSemibold
		eS.PlaceholderText = e9
		eS.PlaceholderColor3 = THEME.SUBTEXT
		eS.TextColor3 = THEME.TEXT
		eS.TextSize = 14.000
		eS.TextXAlignment = Enum.TextXAlignment.Left
		eS.Text = ""

		eT.Name = "OpenDropdown"
		eT.Parent = eQ
		eT.BackgroundColor3 = THEME.SECTION
		eT.BackgroundTransparency = 1.000
		eT.BorderSizePixel = 0
		eT.Position = dn(0.907051265, 0, 0.178571433, 0)
		eT.Size = dn(0, 18, 0, 18)
		eT.Font = Enum.Font.Gotham
		eT.Text = "+"
		eT.TextColor3 = THEME.TEXT
		eT.TextSize = 22.000

		eU.Name = "DropdownBottom"
		eU.Parent = e4
		eU.BackgroundColor3 = THEME.SECTION
		eU.BorderSizePixel = 0
		eU.ClipsDescendants = true
		eU.Position = dn(0.0185185187, 0, 0.206896558, 0)
		eU.Size = dn(0, 312, 0, 0)
		eU.AutoButtonColor = false
		eU.Font = Enum.Font.GothamSemibold
		eU.Text = ""
		eU.TextColor3 = THEME.TEXT
		eU.TextSize = 14.000
		eU.TextXAlignment = Enum.TextXAlignment.Left
		eU.Visible = false

		eV.CornerRadius = R.big
		eV.Name = "DropdownBottomCorner"
		eV.Parent = eU

		eW.Name = "DropdownBottomLayout"
		eW.Parent = eU
		eW.HorizontalAlignment = Enum.HorizontalAlignment.Center
		eW.SortOrder = Enum.SortOrder.LayoutOrder
		eW.Padding = dm(0, 6)

		eX.Name = "DropdownBottomPadding"
		eX.Parent = eU
		eX.PaddingTop = dm(0, 6)

		local eY = false
		eW:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if not eY then return end
			dv:Tween({ Size = dn(0, 312, 0, eW.AbsoluteContentSize.Y + 12) }, eU, 0.1):Play()
		end)

		local function filterByText()
			local NewValue = eS.Text
			for _, Element in next, eU:GetChildren() do
				if Element:IsA("TextButton") then
					Element.Visible = string.find(Element.Name:lower(), NewValue:lower()) ~= nil
				end
			end
		end
		local function toggleDropdown()
			eY = not eY
			if eY then
				eU.Visible = true
				filterByText()
			else
				task.spawn(function()
					task.wait(0.35)
					eU.Visible = false
				end)
			end
			eT.Text = eY and "-" or "+"
			dv:Tween({ Size = dn(0, 312, 0, eY and eW.AbsoluteContentSize.Y + 12 or 0) }, eU, 0.35):Play()
		end

		eT.MouseButton1Click:Connect(toggleDropdown)
		eS.Focused:Connect(function()
			if eY then return end
			toggleDropdown()
		end)
		eS:GetPropertyChangedSignal("Text"):Connect(filterByText)

		library.flags[du].SetOptions = function(self, eP)
			library.flags[du]:ClearOptions()
			for ai = 1, #eP do
				library.flags[du]:AddOption(eP[ai])
			end
		end
		library.flags[du].ClearOptions = function(self)
			local f1 = eU:GetChildren()
			for ai = 1, #f1 do
				local dx = f1[ai]
				if dx:IsA("TextButton") then dx:Destroy() end
			end
		end
		library.flags[du].AddOption = function(self, bd)
			local f2 = dq("TextButton")
			local f3 = dq("UICorner")
			f2.Name = bd
			f2.Parent = eU
			f2.BackgroundColor3 = THEME.CONTROL.DROPDOWN_ITEM_BG
			f2.BorderSizePixel = 0
			f2.Size = dn(0, 300, 0, 28)
			f2.AutoButtonColor = false
			f2.Font = Enum.Font.GothamSemibold
			f2.Text = bd
			f2.TextColor3 = THEME.TEXT
			f2.TextSize = 14.000

			f3.CornerRadius = R.big
			f3.Name = "OptionCorner"
			f3.Parent = f2

			f2.MouseButton1Click:Connect(function()
				eS.PlaceholderText = bd
				eS.Text = ""
				library.flags[du].State = bd
				task.spawn(toggleDropdown)
				ea(bd)
			end)
		end
		library.flags[du].RemoveOption = function(self, bd)
			eU:WaitForChild(bd):Destroy()
		end
		library.flags[du]:SetOptions(eP)
	end

	function e7:NewBox(e9, du, ea)
		local ea = ea or dr
		local eB = dq("TextButton")
		local eC = dq("UICorner")
		local eH = dq("TextBox")
		local eI = dq("UICorner")

		eB.Name = "SliderModule"
		eB.Parent = e4
		eB.BackgroundColor3 = THEME.SECTION
		eB.BorderSizePixel = 0
		eB.Position = dn(0, 0, -0.140425533, 0)
		eB.Size = dn(0, 312, 0, 28)
		eB.AutoButtonColor = false
		eB.Font = Enum.Font.GothamSemibold
		eB.Text = "  " .. e9
		eB.TextColor3 = THEME.TEXT
		eB.TextSize = 14.000
		eB.TextXAlignment = Enum.TextXAlignment.Left

		eC.CornerRadius = R.big
		eC.Name = "BoxButtonCorner"
		eC.Parent = eB

		eH.Name = "Box"
		eH.Parent = eB
		eH.BackgroundColor3 = THEME.INPUT
		eH.BorderSizePixel = 0
		eH.Position = dn(0.774615362, 0, 0.178571433, 0)
		eH.Size = dn(0, 65, 0, 18)
		eH.Font = Enum.Font.Gotham
		eH.Text = ""
		eH.PlaceholderText = du
		eH.PlaceholderColor3 = THEME.SUBTEXT
		eH.TextColor3 = THEME.TEXT
		eH.TextSize = 12.000

		eI.CornerRadius = R.small
		eI.Name = "BoxCorner"
		eI.Parent = eH

		eH.FocusLost:Connect(function(EnterPressed)
			if not EnterPressed then return end
			ea(eH.Text)
			if getgenv().ClearTextBoxText then
				wait(0.10)
				eH.Text = ""
			end
		end)
	end

	return e7
end

setmetatable(getgenv().library, {
	__newindex = function(self, i, v)
		if i == 'Name' then
			dG.Text = "   " .. v
			return true
		end
		rawset(self, i, v)
	end
})
