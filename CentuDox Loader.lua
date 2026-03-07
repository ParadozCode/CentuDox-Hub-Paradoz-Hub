local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer


local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.Name = "CentuDox_KickSystem"
Gui.IgnoreGuiInset = true
Gui.DisplayOrder = 2147483647 -- Max Priority

-- Background Blur for the "Frozen" look
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
blur.Size = 25

local Main = Instance.new("CanvasGroup", Gui)
Main.Size = UDim2.new(0, 500, 0, 250)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0

local Corner = Instance.new("UICorner", Main)
Corner.CornerRadius = UDim.new(0, 12)

-- NEON BORDER
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 3
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- GLOW ANIMATION
task.spawn(function()
    while true do
        local info = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
        TweenService:Create(Stroke, info, {Color = Color3.fromRGB(0, 255, 255)}):Play()
        task.wait(3)
    end
end)

-- TITLE
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0.1, 0)
Title.BackgroundTransparency = 1
Title.Text = "CentuDox System"
Title.Font = Enum.Font.Jura
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- MESSAGE
local Msg = Instance.new("TextLabel", Main)
Msg.Size = UDim2.new(0.9, 0, 0.4, 0)
Msg.Position = UDim2.new(0.5, 0, 0.45, 0)
Msg.AnchorPoint = Vector2.new(0.5, 0.5)
Msg.BackgroundTransparency = 1
Msg.Text = "This script doesn't work.\nGet new loadstring in Centu Sherman's YouTube channel."
Msg.Font = Enum.Font.Jura
Msg.TextSize = 18
Msg.TextColor3 = Color3.fromRGB(200, 200, 200)
Msg.TextWrapped = true

-- EXIT BUTTON
local ExitBtn = Instance.new("TextButton", Main)
ExitBtn.Size = UDim2.new(0, 180, 0, 45)
ExitBtn.Position = UDim2.new(0.5, 0, 0.8, 0)
ExitBtn.AnchorPoint = Vector2.new(0.5, 0.5)
ExitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ExitBtn.Text = "EXIT GAME"
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.TextSize = 18
ExitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)

Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 8)

--================ FREEZE LOGIC =================--
-- Disable Character movement
local controls = require(player.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
controls:Disable()

-- Mouse Lock Force (Ensures they can only see the UI)
UserInputService.MouseIconEnabled = true

-- High-frequency freeze to prevent interaction with world
local FreezeLoop = RunService.RenderStepped:Connect(function()
    player.Character:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
end)

--================ EXIT ACTION =================--
ExitBtn.MouseButton1Click:Connect(function()
    blur:Destroy()
    FreezeLoop:Disconnect()
    player:Kick("\n[CentuDox] Outdated Script\nCheck Centu Sherman's YouTube for the latest update.")
end)

-- Simple hover effect for the button
ExitBtn.MouseEnter:Connect(function()
    TweenService:Create(ExitBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

ExitBtn.MouseLeave:Connect(function()
    TweenService:Create(ExitBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
end)
