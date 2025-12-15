--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// ScreenGui
local Gui = Instance.new("ScreenGui")
Gui.Name = "ProjectPP_Loading"
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 999
Gui.Parent = playerGui

--// Background
local BG = Instance.new("Frame")
BG.Parent = Gui
BG.Size = UDim2.new(1,0,1,0)
BG.BackgroundColor3 = Color3.fromRGB(0,0,0)
BG.BackgroundTransparency = 1
BG.BorderSizePixel = 0

--// Helper
local function Circle(parent, size, pos, z, id)
	local img = Instance.new("ImageLabel")
	img.Parent = parent
	img.Size = size
	img.Position = pos
	img.AnchorPoint = Vector2.new(0.5,0.5)
	img.BackgroundTransparency = 1
	img.Image = "rbxassetid://"..id
	img.ZIndex = z
	local c = Instance.new("UICorner", img)
	c.CornerRadius = UDim.new(1,0)
	return img
end

--// Center
local Center = Instance.new("Frame")
Center.Parent = BG
Center.Size = UDim2.new(0,160,0,160)
Center.Position = UDim2.new(0.5,0,0.45,0)
Center.AnchorPoint = Vector2.new(0.5,0.5)
Center.BackgroundTransparency = 1

--// Ring (WHITE)
local Ring = Circle(Center, UDim2.new(0,160,0,160), UDim2.new(0.5,0,0.5,0), 1, "7102118272")
Ring.ImageColor3 = Color3.fromRGB(255,255,255)

--// Logo
local Logo = Circle(Center, UDim2.new(0,100,0,100), UDim2.new(0.5,0,0.5,0), 2, "96254927950057")

--// Planet (bigger)
local Planet = Circle(Center, UDim2.new(0,30,0,30), UDim2.new(0.5,0,0,0), 3, "96254927950057")

--// Percent Background
local PercentBG = Instance.new("Frame")
PercentBG.Parent = BG
PercentBG.Size = UDim2.new(0,120,0,36)
PercentBG.Position = UDim2.new(0.5,0,0.63,0)
PercentBG.AnchorPoint = Vector2.new(0.5,0.5)
PercentBG.BackgroundColor3 = Color3.fromRGB(20,20,20)
PercentBG.BackgroundTransparency = 0.2
PercentBG.ZIndex = 5
local pc = Instance.new("UICorner", PercentBG)
pc.CornerRadius = UDim.new(0,10)

--// Percent Text
local Percent = Instance.new("TextLabel")
Percent.Parent = PercentBG
Percent.Size = UDim2.new(1,0,1,0)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.Font = Enum.Font.SourceSansBold
Percent.TextSize = 22
Percent.TextColor3 = Color3.new(1,1,1)
Percent.ZIndex = 6

--// Fade In
TweenService:Create(BG, TweenInfo.new(0.6), {BackgroundTransparency = 0}):Play()

--// Loading Logic
local duration = 5
local start = tick()
local angle = math.pi / 2
local radius = 80

local conn
conn = RunService.RenderStepped:Connect(function(dt)
	local alpha = math.clamp((tick() - start) / duration, 0, 1)
	Percent.Text = math.floor(alpha * 100) .. "%"

	-- Ring rotate
	Ring.Rotation += 0.4

	-- Planet orbit (Right → Left → End at Top)
	angle = (math.pi/2) - (math.pi*2*alpha)
	Planet.Position = UDim2.new(
		0.5, math.cos(angle) * radius,
		0.5, math.sin(angle) * radius
	)
end)

task.wait(duration)
conn:Disconnect()

--// ENDING (เข้าแบบไหน ออกแบบนั้น)
TweenService:Create(BG, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
TweenService:Create(Center, TweenInfo.new(0.5), {Size = UDim2.new(0,0,0,0)}):Play()
TweenService:Create(PercentBG, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(Percent, TweenInfo.new(0.4), {TextTransparency = 1}):Play()

task.wait(0.7)
Gui:Destroy()
