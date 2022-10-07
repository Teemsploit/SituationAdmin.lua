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
local function ran(b,c)Zero=Zero+1;if b~=nil and c~=nil then return math.floor(b+math.random(math.randomseed(os.clock()+Zero))*999999%c)else return math.floor(math.random(math.randomseed(os.clock()+Zero))*100)end end
rconsolename(Title .. " ".. User)

local commands = {
    bitchcount = function()
        local Amount = "You have "
local Bitches = " Bitches."
local Zero = 0
local DisplayAmount = Ran()
messagebox(Amount .. DisplayAmount .. Bitches, "How many bitches do you have?", 0)
    end, 
    clear = function()
        rconsoleclear()
    end,
}

function nexthandler()
    rconsoleclear()
    rconsoleprint("@@WHITE@@")
    rconsoleprint("Input: ")

    local command = string.lower(rconsoleinput())
    local getCommand = commands[command]

    if(getCommand) then 
        commands[command]()
        
        rconsoleprint("@@GREEN@@")
        rconsoleprint("Executed " .. command .. " successfully!\n")
    else
        rconsoleerr("Failed to execute " .. command .. "!\n")
    end

    nexthandler()
end

nexthandler()
