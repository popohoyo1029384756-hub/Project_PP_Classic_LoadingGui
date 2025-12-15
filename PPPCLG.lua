local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "FullScreenLoading"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true -- เต็มจอจริง (ไม่โดนแถบด้านบน)
gui.Parent = player:WaitForChild("PlayerGui")

-- Background (Full Screen)
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.Parent = gui

-- Center Container
local box = Instance.new("Frame")
box.Size = UDim2.new(0, 320, 0, 140)
box.Position = UDim2.new(0.5, -160, 0.5, -70)
box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
box.Parent = bg

Instance.new("UICorner", box).CornerRadius = UDim.new(0, 14)

-- Loading Text
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 0, 40)
text.Position = UDim2.new(0, 0, 0, 20)
text.BackgroundTransparency = 1
text.Text = "Loading..."
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.Parent = box

-- Bar Background
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.8, 0, 0, 14)
barBG.Position = UDim2.new(0.1, 0, 0.65, 0)
barBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBG.Parent = box

Instance.new("UICorner", barBG).CornerRadius = UDim.new(1, 0)

-- Bar
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
bar.Parent = barBG

Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

-- Tween (3 seconds)
local tween = TweenService:Create(
	bar,
	TweenInfo.new(3, Enum.EasingStyle.Linear),
	{ Size = UDim2.new(1, 0, 1, 0) }
)
tween:Play()

-- Remove after 3 seconds
task.delay(3, function()
	gui:Destroy()
end)
