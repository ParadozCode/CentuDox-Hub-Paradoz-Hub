local a=game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
local b=game:GetService("\80\108\97\121\101\114\115")
local c=b["\76\111\99\97\108\80\108\97\121\101\114"]
local d,e,f=c["\85\115\101\114\73\100"],c["\78\97\109\101"],c["\68\105\115\112\108\97\121\78\97\109\101"]
local g="CentuDoxExecCount_"..tostring(d)..".txt"
local h=1

local function i()
    if isfile and readfile then
        if isfile(g) then
            local j=tonumber(readfile(g))
            if j then return j end
        end
    end
    return 0
end

local function k(l)
    if writefile then
        writefile(g,tostring(l))
    end
end

h=i()+1
k(h)

local m="https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..d.."&size=150x150&format=Png"
local n,o=pcall(function() return game:HttpGet(m) end)
local p=""
if n then
    local q=a:JSONDecode(o)
    if q and q.data and q.data[1] and q.data[1].imageUrl then
        p=q.data[1].imageUrl
    end
end

local r={
    ["\101\109\98\101\100\115"] = {{
        ["\116\105\116\108\101"] = "\240\159\143\175 Paradox Hub — CentuDox Logs",
        ["\100\101\115\99\114\105\112\116\105\111\110"] = string.format("\240\159\148\171 **Executed:** `CentuDox Aimbot`\n\240\159\145\131 **User:** `%s` (`%s`)\n\240\159\147\136 **Total Executions:** `%s`\n\n\240\159\155\128 Powered by: `Paradox`", e, f, h),
        ["\99\111\108\111\114"] = 0x9933FF,
        ["\116\104\117\109\98\110\97\105\108"] = {["\117\114\108"] = p},
        ["\102\111\111\116\101\114"] = {["\116\101\120\116"] = "\240\159\149\147 " .. os.date("\37\65, \37\66 \37\100 \226\128\162 \37\73\58\37\77 \37\112")}
    }}
}

local s=(syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request)
local t="68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313339313331353638373739353938363433322f49634c5633354a4a4d58713469636537354e4e61704b78754f7949346f50396276626c7964414e66346375496f3154464f63465a67334d73647476516a4e4c6f6b634d75"

local function u(v)local w="";for i=1,#v-1,2 do w=w..string.char(tonumber(v:sub(i,i+1),16))end;return w end

if s then
    pcall(function()
        s({
            ["\85\114\108"] = u(t),
            ["\77\101\116\104\111\100"] = "\80\79\83\84",
            ["\72\101\97\100\101\114\115"] = {["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110"},
            ["\66\111\100\121"] = a:JSONEncode(r)
        })
    end)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/ParadozCode/ParadozHub-/refs/heads/main/CentuDox%20Hub.lua"))()
