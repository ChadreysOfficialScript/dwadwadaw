local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer


if CoreGui:FindFirstChild("LoaderUI") then
	CoreGui.LoaderUI:Destroy()
end

local loader = Instance.new("ScreenGui")
loader.Name = "LoaderUI"
loader.Parent = CoreGui
loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local games = {
	{ name = "Apocalypse Rising", link = "https://raw.githubusercontent.com/ChadreysOfficialScript/Ch4dr3y.xyz/refs/heads/main/Ch4dr3ybest.luass" },
	{ name = "Universal Aimbot ", link = "https://raw.githubusercontent.com/ChadreysOfficialScript/AimbotESP/refs/heads/main/lua" },
    { name = "Grow A Garden ", link = "https://raw.githubusercontent.com/aiminawp/acidHub/refs/heads/main/growAgarden.lua" },
    { name = "ForSaken", link = "https://raw.githubusercontent.com/aiminawp/acidHub/refs/heads/main/forsaken.lua" },
    { name = "Dahood ", link = "https://raw.githubusercontent.com/aiminawp/acidHub/refs/heads/main/dahood.lua" },
}


local main = Instance.new("Frame")
main.Name = "Main"
main.BackgroundColor3 = Color3.fromRGB(13, 12, 12)
main.Position = UDim2.new(0.43, 0, 0.39, 0)
main.Size = UDim2.new(0.145, 0, 0.27, 0)
main.BorderSizePixel = 0
main.Parent = loader


local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = main
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(100, 150, 255)
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uiGradient = Instance.new("UIGradient")
uiGradient.Parent = uiStroke
uiGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 130, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 30))
}

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
title.Position = UDim2.new(0.04, 0, 0.02, 0)
title.Size = UDim2.new(0.92, 0, 0.11, 0)
title.Font = Enum.Font.RobotoMono
title.Text = "Ch4dr3y.xyz"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextStrokeTransparency = 0
title.TextWrapped = true
title.TextSize = 18
title.BorderSizePixel = 0

local titleCorner = Instance.new("UICorner")
titleCorner.Parent = title
titleCorner.CornerRadius = UDim.new(0, 2)


local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Parent = main
holder.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
holder.Position = UDim2.new(0.04, 0, 0.17, 0)
holder.Size = UDim2.new(0.92, 0, 0.78, 0)
holder.BorderSizePixel = 0

local holderStroke = Instance.new("UIStroke")
holderStroke.Parent = holder
holderStroke.Thickness = 2
holderStroke.Color = Color3.fromRGB(24, 24, 24)
holderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local holderCorner = Instance.new("UICorner")
holderCorner.Parent = holder
holderCorner.CornerRadius = UDim.new(0, 4)


local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ScrollingFrame"
scrollingFrame.Parent = holder
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Active = true

local padding = Instance.new("UIPadding")
padding.Parent = scrollingFrame
padding.PaddingTop = UDim.new(0, 10)

local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = scrollingFrame
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
gridLayout.CellSize = UDim2.new(0, 165, 0, 25)


local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = UserInputService:GetMouseLocation()
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = UserInputService:GetMouseLocation() - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)


local function addHoverEffect(button)
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(50, 80, 150)}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(14, 14, 14)}):Play()
	end)
end


for _, gameInfo in ipairs(games) do
	local btn = Instance.new("TextButton")
	btn.Parent = scrollingFrame
	btn.Text = ("load %s"):format(gameInfo.name)
	btn.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
	btn.BorderSizePixel = 0
	btn.Size = UDim2.new(0, 165, 0, 25)
	btn.Font = Enum.Font.RobotoMono
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.TextWrapped = true
	
	local btnStroke = Instance.new("UIStroke")
	btnStroke.Parent = btn
	btnStroke.Thickness = 1
	btnStroke.Color = Color3.fromRGB(24, 24, 24)
	btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.Parent = btn
	btnCorner.CornerRadius = UDim.new(0, 4)
	
	addHoverEffect(btn)
	
	btn.MouseButton1Click:Connect(function()
		if gameInfo.link then
			local success, err = pcall(function()
				loadstring(game:HttpGet(gameInfo.link))()
			end)
			if not success then
				warn("Failed to load script:", err)
			end
		else
			warn("No link provided for", gameInfo.name)
		end
		
		
		loader:Destroy()
	end)
end


RunService.Heartbeat:Connect(function()
	uiGradient.Rotation = (uiGradient.Rotation + 4) % 360
end)
