-- Ionized is a skid
if not game:IsLoaded() then
	game.Loaded:Wait()
end

messagebox('Please note "Situation admin" is in beta and you may experience bugs.\nType "help" in the console for a list of commands\nif you need further support please join the discord server https://discord.gg/5VAKhPQh8Z\nCredits:\nTeem\nDrqonic\nionized particle/AtpZombie42\nHoppingShark1437', 'Situation Admin', 0)



-- by clicking 'OK' you have signed your soul over to Teem

assert(rconsoleprint, "Your exploit is not supported!")
assert(fireproximityprompt, "Your exploit is not supported!")

local HttpService = game:GetService("HttpService");
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local character = Player.Character
local Humanoid = character:WaitForChild("Humanoid")
local User = Player.Name

local plugins_directory = "situation_plugins"

rconsolename("Welcome to Situation Admin | " .. User)

local function getroot(char)
	return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
end

local hookfunction = hookfunction or function(func, newfunc, applycclosure)
	if replaceclosure then
		replaceclosure(func, newfunc)
		return func
	end
	func = applycclosure and (newcclosure or function(f) return f end) or newfunc
	return func
end

local function load_plugins()
	if isfolder(plugins_directory) == false then
		makefolder(plugins_directory)
	end

	local files = listfiles(plugins_directory)

	for key, value in pairs(files) do
		local file = value:match("[^\\^/]*.lua$")

		if file ~= nil then
			local filename = file:sub(0, #file-4)

			local call = loadstring(readfile(value))

			commands[filename] = call
		end
	end
end

commands = {
	help = function(...)
		for key, value in pairs(commands) do
			rconsoleprint("@@WHITE@@")
			rconsoleprint(key .. ',\n')
		end
	end, 

	supportserver = function(...)
		rconsoleprint("https://discord.gg/aK6k4HKKjb\n Server link has been copied to your clipboard.\n")

		setclipboard("https://discord.gg/aK6k4HKKjb")  
	end, 

	noproximitycooldown = function(...)
		game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(fireproximityprompt)
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
				rconsolewarn("It seems this game has a custom chat. This command will not work.")
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
	
	spoofmemory = function(...)
		hookfunction((gcinfo or collectgarbage), function(...)
			return math.random(200, 350)
		end)
		
		local gamemt = getrawmetatable(game)
		
		setreadonly(gamemt, false)
		
		local nc = gamemt.__namecall
		
		gamemt.__namecall = newcclosure(function(...)
			if (getnamecallmethod() == "GetTotalMemoryUsageMb") then
				return math.random(395, 405)
			end

			return nc(...)
		end)
		
		hookfunction(game.Stats.GetTotalMemoryUsageMb, function()
			return math.random(395, 405)
		end)
		
		rconsoleprint("Memory Spoofed!\n")
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
		local args = {...}
		
		-- Check if true or false
		joinlogsenabled = args[1] or not joinlogsenabled
		
		if joinlogsenabled then
			joinlogcon = Players.PlayerAdded:Connect(function(plr)
				rconsoleprint("@@WHITE@@")
				rconsoleprint("\n" .. plr.Name .. " has joined, account is " .. plr.AccountAge .. " days old!\nInput: ")
			end)
			
			leavelogcon = Players.PlayerRemoving:Connect(function(plr)
				rconsoleprint("@@WHITE@@")
				rconsoleprint("\n" .. plr.Name .. " has left!\nInput: ")
			end)
		elseif not joinlogsenabled and joinlogcon and leavelogcon then
			joinlogcon = joinlogcon:Disconnect()
			leavelogcon = leavelogcon:Disconnect()
		end
	end, 
	
	btools = function(...)
		local Player = Players.LocalPlayer
		local backpack = Player.Backpack

		local hammer = Instance.new("HopperBin")
		hammer.Name = "Hammer"
		hammer.BinType = 4
		hammer.Parent = backpack

		local cloneTool = Instance.new("HopperBin")
		cloneTool.Name = "Clone"
		cloneTool.BinType = 3
		cloneTool.Parent = backpack

		local grabTool = Instance.new("HopperBin")
		grabTool.Name = "Grab"
		grabTool.BinType = 2
		grabTool.Parent = backpack
	end, 
	
	funfact = function(...)
		rconsoleprint(HttpService:JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")).text .. "\n")
	end, 
	
	walkspeed = function(...)
		local args = {...}
		local ws = args[1]
		
		Humanoid.WalkSpeed = ws
	end, 
	
	jumppower  = function(...)
		local args = {...}
		local jp = args[1]
		
		Humanoid.JumpPower = jp
	end, 
	
	hipheight  = function(...)
		local args = {...}
		local hh = args[1]
		
		Humanoid.HipHeight = hh
	end, 
	
	avatar = function(...)
		local args = {...}
		local id = args[1]
		local newmodel = Players:GetCharacterAppearanceAsync(id)

		character = newmodel
		
		rconsolewarn("This is client-side only!\n")
	end, 
	
	serverhop = function(...)
		local x = {}
		local pid = game.PlaceId
		local jid = game.JobId
		local tps = game:GetService("TeleportService")

		for _, v in ipairs(HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. pid .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		    
		    --[[ method is slow ]]
		    
		    if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= jid then
		        x[#x + 1] = v.id
		    end
		end

		if #x > 0 then
		    tps:TeleportToPlaceInstance(pid, x[math.random(1, #x)])
		end
	end, 
	
	esp = function(...)
		loadstring(game:GetObjects("rbxassetid://10342057499")[1].Source)()
	end, 
	
	antiafk = function(...)
		for i, v in pairs(getconnections(Players.LocalPlayer.Idled)) do
			v:Disable()
		end
	end, 
	
	chat = function(...)
		local args = {...}
		local message = args[1]
		local storage = game:GetService("ReplicatedStorage")
		
		if storage:FindFirstChild("DefaultChatSystemChatEvents") then
			storage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
		else
			rconsolewarn("It seems this game has a custom chat this command will not work.\n")
		end
	end, 
	
	cocksize = function(...)
		rconsolewarn("Your cock is " .. math.random(1, 600) / 100 .. " inches.")
	end, 
	--[[
	Wont Work
	noclip = Humanoid:ChangeState(11), 
	]]
	clear = rconsoleclear
}

while task.wait() do
	rconsoleprint("@@WHITE@@")
	rconsoleprint("Input: ")

	local args = rconsoleinput()
	local tokens = {}

	for v in string.gmatch(args, "([^ ]+)") do
		table.insert(tokens, v)
	end

	if tokens[1] ~= nil then
		load_plugins()

		local command = string.lower(tokens[1])
		local getCommand = commands[command]

		table.remove(tokens, 1)

		if getCommand then
			local success = pcall(commands[command], table.unpack(tokens))

			if success then
				rconsoleprint("@@GREEN@@")
				rconsoleprint("Executed " .. command .. " successfully!\n")
			else
				rconsoleerr("An error occurred while running " .. command .. "\n")
			end
		else
			rconsoleerr("Failed to execute " .. command .. "!\n")
		end
	end
end
