--[[
idk if this works made it in 5 mins
]]

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiriot22/ESP-Lib/main/ESP.lua"))()

    if _G.Enabled == nil then _G.Enabled = true end
    if _G.Boxes == nil then _G.Boxes = true end
    if _G.TeamColors == nil then _G.TeamColors = true end
    if _G.Tracers == nil then _G.Tracers = false end
    if _G.Names == nil then _G.Names = true end
	
    while task.wait(.1) do
        ESP:Toggle(_G.Enabled or false)
        ESP.Boxes = _G.Boxes or false
        ESP.TeamColors = _G.TeamColors or false
        ESP.Tracers = _G.Tracers or false
        ESP.Names = _G.Names or false
    end

    _G.Loaded = true
end
