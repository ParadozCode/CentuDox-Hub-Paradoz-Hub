

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local newLoader = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ParadozCode/CentuDox-Hub-Paradoz-Hub/refs/heads/main/CentuDox%20V2.lua", true))()'
local kickMessage = [[
Changed to new loadstring
loadstring(game:HttpGet("https://raw.githubusercontent.com/ParadozCode/CentuDox-Hub-Paradoz-Hub/refs/heads/main/CentudoxLoader.xyz", true))()

It automatically has been copied to your clipboard. Use it instead of this loader!
]]

local copied = false
pcall(function()
    if setclipboard then
        setclipboard(newLoader)
        copied = true
    end
end)


pcall(function()
    if copied then
        StarterGui:SetCore("SendNotification", {
            Title = "Loader Updated";
            Text = "New loader copied to clipboard.";
            Duration = 4;
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Loader Update";
            Text = "Couldn't auto-copy. New loadstring printed to console.";
            Duration = 5;
        })
      
        print("== New loader (copy this) ==\n" .. newLoader .. "\n============================")
    end
end)

-- short delay to let notification show
wait(1)

-- Kick the player with the provided message
if LocalPlayer and LocalPlayer.Kick then
    LocalPlayer:Kick(kickMessage)
else
    
    error(kickMessage)
end
