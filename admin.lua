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
local string = string

rconsolename(Title .. " " .. User)

local function getroot(char)
    local rpart =
        char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    return rpart
end

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
    btools = function()
        local backpack = Player.Backpack

        hammer = Instance.new("HopperBin")
        hammer.Name = "Hammer"
        hammer.BinType = 4
        hammer.Parent = backpack

        cloneTool = Instance.new("HopperBin")
        cloneTool.Name = "Clone"
        cloneTool.BinType = 3
        cloneTool.Parent = backpack

        grabTool = Instance.new("HopperBin")
        grabTool.Name = "Grab"
        grabTool.BinType = 2
        grabTool.Parent = backpack
    end,
   
    funfact = function()
        rconsoleprint(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")).text\n)
        end,
    
    --[[ 
    noclip = Humanoid:ChangeState(11), 
    ]]--
    clear = rconsoleclear
}

function nexthandler()
    rconsoleprint("@@WHITE@@")
    rconsoleprint("Input: ")

    local command = string.lower(rconsoleinput())
    local getCommand = commands[command]
    --local args = string.split(command, " ")

    if getCommand then
        commands[command]()

        rconsoleprint("@@GREEN@@")
        rconsoleprint("Executed " .. command .. " successfully!\n")
    else
        rconsoleerr("Failed to execute " .. command .. "!\n")
    end

    nexthandler()
end

nexthandler()
