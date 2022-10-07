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
local commands = {
  one = function()
        rconsoleprint("k \n")
    end,
    two = function()
        rconsoleprint("hi \n")
    end,
    
}

function nexthandler()
    rconsoleprint("@@WHITE@@")
    rconsoleprint("Input: ")

    local command = string.lower(rconsoleinput())
    local getCommand = commands[command]

    if(getCommand) then
        rconsoleprint("@@GREEN@@")

        commands[command]()

        rconsoleprint("Executed " .. command .. " successfully!\n")

        nexthandler()
    else
        rconsoleerr("Failed to execute " .. command .. "!\n")

        nexthandler()
    end
end
nexthandler()
