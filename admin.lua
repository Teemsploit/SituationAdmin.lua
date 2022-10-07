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

--[[
You can thank Drqonic for this actual good implementation of commands.
-------------------------------------------------------------------------
Thank you Drqonic <3
]]--

local commands = {
	teleport = function()
		for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
			rconsoleprint(i .. ".) " .. plr.Name .. "\n")
		end

		rconsoleprint("Choice: ")

		playerNum = tonumber(rconsoleinput())
		plr = game:GetService("Players"):GetPlayers()[playerNum].Name

		Player.character.HumanoidRootPart.CFrame = Players[plr].Character.HumanoidRootPart.CFrame
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
