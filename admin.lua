--[[
REMOVE ME

colours do not work in script-ware
]]


if not game:IsLoaded() then
	game.Loaded:Wait()
end

assert(rconsoleprint, "Your exploit is not supported!")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local character = Player.Character
local Humanoid = character:WaitForChild("Humanoid")
local User = Player.Name

rconsolename("Welcome to Situation Admin | " .. User)

local function getroot(char)
	local rpart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	return rpart
end

local import = function(asset)
	if type(asset) == "number" then
		return game:GetObjects("rbxassetid://" .. asset)[1]
	else
		local link = string.format("https://raw.githubusercontent.com/Teemsploit/SituationAdmin.lua/main/plugins/%s", asset)
		local resp = game:HttpGetAsync(link)
		local callfunc = loadstring(resp)
		local Success, weget = pcall(callfunc)
		if Success then
			return weget
		else
			rconsolewarn("Failed to import" .. "'" .. asset .. "'")
		end
	end
end

commands = {
    help = function(...)
		for key, value in pairs(commands) do
			
			rconsoleprint(key .. '\n')
		end
	end,
    lagserver = function(...)
		for _, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
			v:Disable()
		end
		local storage = game:GetService("ReplicatedStorage")
		local v = 96000000
		local msg = "" .. string.rep(" ", (v - 12))
		for i = 1, 7 do
			if storage:FindFirstChild("DefaultChatSystemChatEvents") then
				storage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
			else
				rconsolewarn("It seems this game has a custom chat this command will not work.")
			end
		end
	end,
	deletetouchinterests = function(...)
		for _, v in ipairs(workspace:GetDescendants()) do
			if v.IsA(v, "TouchTransmitter") then
				v:Destroy()
			end
		end
	end,
	networkownership = function(...)
		local function network()
			local Render = game:GetService("RunService").RenderStepped
			local Huge = math.huge * math.huge
			local BigHuge = math.pow(math.huge, math.huge)
			Render:Connect(function()
				sethiddenproperty(Player, 'MaximumSimulationRadius', BigHuge)
				sethiddenproperty(Player, 'SimulationRadius', Huge)
			end)
		end
		network()
	end,
    spoofmemory = function(...)
		hookfunction((gcinfo or collectgarbage), function(...)
			return math.random(200, 350)
		end)
		task.wait(0.01)
		local gamemt = getrawmetatable(game)
		setreadonly(gamemt, false)
		local nc = gamemt.__namecall
		gamemt.__namecall = newcclosure(function(...)
			if (getnamecallmethod() == 'GetTotalMemoryUsageMb') then
				return math.random(395, 405)
			end
			return nc(...)
		end)
		hookfunction(game.Stats.GetTotalMemoryUsageMb, function()
			return math.random(395, 405)
		end)
		task.wait()
		rconsoleprint("Memory Spoofed! \n")
	end,
        
    teleport = function(...)
		for i, plr in ipairs(Players:GetPlayers()) do
			rconsoleprint(i .. ".) " .. plr.Name .. "\n")
		end
		rconsoleprint("Choice: ")
		local playerNum = tonumber(rconsoleinput())
		local players = Players:GetPlayers()
		if playerNum ~= nil and playerNum > 0 and playerNum <= #players then
			local plrchar = players[playerNum].Character
			getroot(character).CFrame = getroot(plrchar).CFrame
		else
			rconsolewarn("Player chosen is invalid!\n")
		end
	end,
    bitchcount = function(...)
		rconsolewarn("You have " .. math.random(1, 100) .. " bitches")
	end,
    joinlogs = function(...)
		local args = {
			...
		}
		joinlogsenabled = args[1] or not joinlogsenabled
		if joinlogsenabled then
			joinlogcon = Players.PlayerAdded:Connect(function(plr)
		
				rconsoleprint("\n" .. plr.Name .. " has joined, account is " .. plr.AccountAge .. " days old!\n")
			end)
			leavelogcon = Players.PlayerRemoving:Connect(function(plr)
			
				rconsoleprint("\n" .. plr.Name .. " has left!\n")
			end)
		elseif not joinlogsenabled and joinlogcon and leavelogcon then
			joinlogcon = joinlogcon:Disconnect()
			leavelogcon = leavelogcon:Disconnect()
		end
	end,
    btools = function(...)
		import("btools.lua")
	end,
    funfact = function(...)
		rconsoleprint(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")).text)
		rconsoleprint("\n")
	end,
    walkspeed = function(...)
		local args = {
			...
		}
		local ws = args[1]
		Humanoid.WalkSpeed = ws
	end,
        jumppower  = function(...)
		local args = {
			...
		}
		local jp = args[1]
		Humanoid.JumpPower = jp
	end,
           hipheight  = function(...)
		local args = {
			...
		}
		local hh = args[1]
		Humanoid.HipHeight = hh
	end,
    avatar = function(...)
		local args = {
			...
		}
		local id = args[1]
		local newmodel = Players:GetCharacterAppearanceAsync(id)
		character = newmodel
		rconsolewarn("This is client-side only!\n")
	end,
    serverhop = function(...)
		import("serverhop.lua")
	end,
    esp = function(...)
		import("ESP.lua")
	end,
    antiafk = function(...)
		for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
			v:Disable()
		end
	end,
    chat = function(...)
		local args = {
			...
		}
		local Message = args[1]
		local storage = game:GetService("ReplicatedStorage")
		if storage:FindFirstChild("DefaultChatSystemChatEvents") then
			storage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, "All")
		else
			rconsolewarn("It seems this game has a custom chat this command will not work.")
		end
	end,
    
    cocksize = function(...)
		local rnumb = math.random(1, 600)
		rconsolewarn("Your cock is " .. rnumb / 100 .. " inches.")
	end,
    --[[
	Wont Work
    noclip = Humanoid:ChangeState(11), ]]
    fly = import('fly.lua')
    clear = rconsoleclear}

function nexthandler()
	
	rconsoleprint("Input: ")
	local args = rconsoleinput()
	local tokens = {}
	for v in string.gmatch(args, "([^ ]+)") do
		table.insert(tokens, v)
	end
	local command = string.lower(tokens[1])
	local getCommand = commands[command]
	table.remove(tokens, 1)
	if getCommand then
		commands[command](table.unpack(tokens))
		
		rconsoleprint("Executed " .. command .. " successfully!\n")
	else
		rconsoleerr("Failed to execute " .. command .. "!\n")
	end
	nexthandler()
end

nexthandler()
