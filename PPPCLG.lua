local LOGO = Instance.new("ScreenGui")

local Face = Instance.new("ImageLabel")

local Orbit = Instance.new("ImageLabel")

local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

local UICorner = Instance.new("UICorner")

local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

--Properties:

LOGO.Name = "LOGO"

LOGO.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

LOGO.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

LOGO.ResetOnSpawn = false

Face.Name = "Face"

Face.Parent = LOGO

Face.Active = true

Face.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

Face.BackgroundTransparency = 1.000

Face.BorderColor3 = Color3.fromRGB(0, 0, 0)

Face.BorderSizePixel = 0

Face.Position = UDim2.new(-0.0848358572, 0, 0.40941292, 0)

Face.Size = UDim2.new(0.0988271087, 0, 0.108296312, 0)

Face.Image = "rbxassetid://107515080715823"

Orbit.Name = "Orbit"

Orbit.Parent = Face

Orbit.AnchorPoint = Vector2.new(0.5, 0.5)

Orbit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

Orbit.BackgroundTransparency = 1.000

Orbit.BorderColor3 = Color3.fromRGB(0, 0, 0)

Orbit.BorderSizePixel = 0

Orbit.Position = UDim2.new(0.495019555, 0, 0.489923686, 0)

Orbit.Size = UDim2.new(2.24704003, 0, 1.5323751, 0)

Orbit.ZIndex = 2147483647

Orbit.Image = "http://www.roblox.com/asset/?id=109266385905091"

Orbit.ScaleType = Enum.ScaleType.Fit

UIAspectRatioConstraint.Parent = Orbit

UICorner.CornerRadius = UDim.new(1, 0)

UICorner.Parent = Face

UIAspectRatioConstraint_2.Parent = Face

-- Scripts:

local function LLLBHB_fake_script() -- Orbit.LocalScript 

	local script = Instance.new('LocalScript', Orbit)

	local step = (2*math.pi)/450

	local rotvel = 1

	local theta = 0

	local Ring = script.Parent

	

	while game:GetService'RunService'.Heartbeat:Wait() do

		theta = theta < 360 and theta + step or 0

		Ring.Rotation = Ring.Rotation < 360 and Ring.Rotation + rotvel or 0

		game:GetService'RunService'.Heartbeat:wait()

	end

end

coroutine.wrap(LLLBHB_fake_script)()

local function NLSE_fake_script() -- LOGO. 

	local script = Instance.new('LocalScript', LOGO)

	local logo = script.Parent:FindFirstChildOfClass("ImageLabel")

	

	logo:TweenPosition(UDim2.new(0.465, 0,0.441,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 1)

	wait(2)

	logo:TweenPosition(UDim2.new(0.022,0,0.853,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 1)

	

end

coroutine.wrap(NLSE_fake_script)()

local function JPADOFI_fake_script() -- LOGO.Script 

	local script = Instance.new('Script', LOGO)

	script.Parent.ResetOnSpawn = false

end

coroutine.wrap(JPADOFI_fake_script)()
