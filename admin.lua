local game = game
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local character = Player.Character
local Humanoid = character:WaitForChild("Humanoid")
local Mouse = Player:GetMouse()
local User = Player.Name
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Network = game:GetService("NetworkClient")
local Title = "Welcome to admin "
local Date = os.date
local rconsoleclear = rconsoleclear
local rconsoleprint = rconsoleprint
local rconsoleinput = rconsoleinput
local Space = " "
local Version = " | Beta Version"
local Start = "admin is in beta | "
rconsolename(Title .. User .. Version)
local Commands = {
    ["sit"] = function()
        Humanoid.Sit = true
    end,
    Two = function()
        print("hi")
    end
}

function nexthandler()
    rconsoleclear()
    rconsoleprint("@@WHITE@@")
    rconsoleprint("Commands:\n- Input: ")
    local newinput = rconsoleinput()

    for funcname, func in pairs(Commands) do
        if newinput == funcname or string.upper(newinput) == string.upper(funcname) then
            rconsoleprint("@@GREEN@@")
            rconsoleprint("Executed", funcname, "successfully!")
            func()
            nexthandler()
        else
            nexthandler()
        end
    end
end

nexthandler()
