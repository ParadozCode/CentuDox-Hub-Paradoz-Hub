
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


local discordLink = "https://discord.gg/arczFu2eXt"

if setclipboard then
    setclipboard(discordLink)
elseif toclipboard then
    toclipboard(discordLink)
end


LocalPlayer:Kick("CentuDox Hub\nScript is now updated to newer updates and will no longer receive updates.\n\nWatch Sherman's new videos and join the Discord:\n" .. discordLink)
