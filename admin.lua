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

rconsolename(Title .. " " .. User)

local function getroot(char)
    local rpart =
        char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    return rpart
end

--[[
You can thank Drqonic for this actual good implementation of commands.
-------------------------------------------------------------------------
Thank you Drqonic <3
]]--

local commands = {
    teleport = function()
        for i, plr in ipairs(Players:GetPlayers()) do
            rconsoleprint(i .. ".) " .. plr.Name .. "\n")
        end

        rconsoleprint("Choice: ")

        playerNum = tonumber(rconsoleinput())
        plrchar = game:GetService("Players"):GetPlayers()[playerNum].Character

        getroot(character).CFrame = getroot(plrchar).CFrame
    end,
    bitchcount = function()
        rconsolewarn("You have " .. math.random(1, 100) .. " bitches")
    end,
    clear = rconsoleclear
}

function nexthandler()
    rconsoleprint("@@WHITE@@")
    rconsoleprint("Input: ")

    local command = string.lower(rconsoleinput())
    local getCommand = commands[command]

    if (getCommand) then
        commands[command]()

        rconsoleprint("@@GREEN@@")
        rconsoleprint("Executed " .. command .. " successfully!\n")
    else
        rconsoleerr("Failed to execute " .. command .. "!\n")
    end

    nexthandler()
end

nexthandler()
