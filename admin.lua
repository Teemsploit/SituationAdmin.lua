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
    ["sit"] = function()
        Humanoid.Sit = true
    end,
    ["clear"] = function()
        rconsoleprint("@@RED@@")
        rconsoleclear()
        rconsoleprint("cleared")
        task.waitwait(0.5)
        rconsoleclear()
    end
}

function nexthandler()
    rconsoleprint("@@WHITE@@")
    local newinput = rconsoleinput()

    for funcname, func in pairs(Commands) do
        if newinput == funcname or string.upper(newinput) == string.upper(funcname) then
            rconsoleprint("@@GREEN@@")
            rconsoleprint("Executed " .. funcname .. " successfully!\n")
            func()
            nexthandler()
        else
            nexthandler()
        end
    end
end

nexthandler()
