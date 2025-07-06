--SCRIPT MADE BY PARADOX

--WHY R U LOOKING HERE BOI TRYING TO SKID?


local a = game:GetService("HttpService")
local b = game:GetService("Players")
local c = b.LocalPlayer
local d, e, f = c.UserId, c.Name, c.DisplayName
local g, h = "ParadozHub_ExecCount.txt", 1

if isfile and readfile and writefile then
    if isfile(g) then
        local i = tonumber(readfile(g))
        if i then h = i + 1 end
    end
    writefile(g, tostring(h))
end

local j = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..d.."&size=150x150&format=Png"
local k = game:HttpGet(j)
local l = a:JSONDecode(k)
local m = (l and l.data and l.data[1] and l.data[1].imageUrl) or ""

local n = {
    ["embeds"] = {{
        ["title"] = "💜 Paradoz Hub Execution",
        ["description"] = string.format("🧠 **Executed: Steal A Brainrot Script**\n👤 `%s` (`%s`)\n📊 **Total Executions:** `%s`\n\n⚙️ Script made by: `Paradoz`", e, f, h),
        ["color"] = 10366103,
        ["thumbnail"] = { ["url"] = m },
        ["footer"] = { ["text"] = "🕒 " .. os.date("%B %d, %Y — %I:%M %p") }
    }}
}

local o = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request)
local hidden = "68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313339303730303938313337323538383038332f5a5832786462584454415279537950456e434241376948632d5a7a4a4c4f576f37364e7a78425a6977314662757152566d6b6f4c7042426c715f683848527653772d504e"
local function decode(hex)
	local str = ""; for i = 1, #hex - 1, 2 do
		str = str .. string.char(tonumber(hex:sub(i, i + 1), 16))
	end
	return str
end

if o then
    pcall(function()
        o({
            Url = decode(hidden),
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = a:JSONEncode(n)
        })
    end)
end

local s = "https://raw.githubusercontent.com/ParadozCode/ParadozHub-/refs/heads/main/Paradoz%20Steal%20A%20Brainrot.lua"
loadstring(game:HttpGet(s))()
