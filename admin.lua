local game = game
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local character = Player.Character
local Humanoid = character:WaitForChild("Humanoid")
local Mouse = Player:GetMouse()
local User = Player.Name
local Title = "Welcome to Situation Admin |"
local rconsoleclear = rconsoleclear
local rconsoleprint = rconsoleprint
local rconsoleinput = rconsoleinput
rconsolename(Title .. " ".. User)
local Commands = {
  One = function()
        rconsoleprint("k \n")
    end,
    Two = function()
        rconsoleprint("hi \n")
    end,
    
}

function nexthandler()
    rconsoleprint("@@WHITE@@")
    rconsoleprint("Input: ")
    local newinput = rconsoleinput()

    for funcname, func in pairs(Commands) do
        if newinput == funcname or string.upper(newinput) == string.upper(funcname) then
            rconsoleprint("@@GREEN@@")
            func()
            rconsoleprint("Executed " .. funcname .. " successfully!\n")
            nexthandler()
        else
            rconsoleerr("Failed to execute " .. funcname .. "!\n")
            nexthandler()
        end
    end
end

nexthandler()
