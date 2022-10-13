local x = {}
local http = game:GetService("HttpService")
local pid = game.PlaceId
local jid = game.JobId
local tps = game:GetService("TeleportService")

for _, v in ipairs(http:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. pid .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
    
    --[[ method is slow ]]
    
    if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= jid then
        x[#x + 1] = v.id
    end
end

if #x > 0 then
    tps:TeleportToPlaceInstance(pid, x[math.random(1, #x)])
end
