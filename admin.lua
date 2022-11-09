if not game:IsLoaded() then
	game.Loaded:Wait()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Alteral323/v/main/libs/compat.lua"))()(true)

messagebox('Please note "Situation admin" is in beta and you may experience bugs or broken commands.\nType "help" in the console for a list of commands\nif you need further support please join the discord server https://discord.gg/5VAKhPQh8Z\nCredits:\nTeem\nDrqonic\nIonized particle/AtpZombie42\nHoppingShark1437\nToon', 'Situation Admin', 0)


-- by clicking 'OK' you have signed your soul over to Teem
assert(rconsoleprint, "Your exploit is not supported!")
assert(fireproximityprompt, "Your exploit is not supported!")
assert(getgenv, "Your exploit is not supported!")

local HttpService = game:GetService("HttpService");
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local tps = game:GetService("TeleportService")
local Player = Players.LocalPlayer
local character = Player.Character
local Humanoid = character:WaitForChild("Humanoid")
local User = Player.Name
local runservice = game:GetService("RunService")
local highlight = Instance.new("Highlight")
local plugins_directory = "situation_plugins"
local rconsolename = (syn and rconsolename) or (rconsolesettitle)

rconsolename("Welcome to Situation Admin | " .. User)

local function split(str, sep)
	if str == nil then
		return {}
	end

	if #sep > 1 then
		return {}
	end

	local tokens = {}

	for v in str:gmatch("([^" .. sep .. "]+)") do
		table.insert(tokens, v)
	end

	return tokens
end

local function getroot(char)
	return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
end

local function load_plugins()
	if isfolder(plugins_directory) == false then
		makefolder(plugins_directory)
	end

	local files = listfiles(plugins_directory)

	for key, value in pairs(files) do
		local file = value:match("[^\\^/]+%.lua$") or value:match("[^\\^/]+%.txt$")

		if file ~= nil then
			local filename = file:sub(0, #file - 4)

			local call = loadstring(readfile(value))

			commands[filename] = call
		end
	end
end

commands = {
	help = function(...)
		local i = 0

		for key, value in pairs(commands) do
			i = i + 1

			rconsoleprint(i .. ".) " .. key .. "\n")
		end
	end, 
	removelegs = function(...)
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "RightUpperLeg" or
				v.Name == "LeftUpperLeg" then
				v:Destroy()
			end
		end
	task.wait()
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Right Leg" or
				v.Name == "Left Leg" then
				v:Destroy()
			end
		end
	end
	end,

	removearms = function(...)
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "RightUpperArm" or
				v.Name == "LeftUpperArm" then
				v:Destroy()
			end
		end
	task.wait()
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Right Arm" or
				v.Name == "Left Arm" then
				v:Destroy()
			end
		end
	end
	end,
	
sit = function(...)
character:FindFirstChildOfClass("Humanoid").Sit = true
end,

jump = function(...)
character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
end,

	execute = function(...)
		local args = {...}
		local text = args[1]
		
		loadstring(text)
	end, 
	
removetoolmesh = function(...)
for _,v in pairs(character:GetChildren()) do
		if v:IsA("Tool") or v:IsA("HopperBin") then
			for i,c in pairs(v:GetDescendants()) do
				if c:IsA("SpecialMesh") then
					c:Destroy()
				end
			end
		end
	end
end,

	getremotes = function(...)
		for i, v in pairs(game:GetDescendants()) do
			if string.match(v.ClassName, "RemoteEvent") then
				rconsoleprint("\nRemoteEvent found!  \nLocation: " .. v:GetFullName() .. "  \nMethod  FireServer\n")
			elseif string.match(v.ClassName, "RemoteFunction") then
				rconsoleprint("\nRemoteFunction found! \nLocation: " .. v:GetFullName() .. "  \nMethod | InvokeServer\n")
			else

			end
		end
	end, 
	getremoteevents = function(...)
		for i, v in pairs(game:GetDescendants()) do
			if string.match(v.ClassName, "RemoteEvent") then
				rconsoleprint("\nRemoteEvent found!  \nLocation: " .. v:GetFullName() .. "  \nMethod  FireServer\n")
			else

			end
		end
	end, 
	getremotefunctions = function(...)
		for i, v in pairs(game:GetDescendants()) do
			if string.match(v.ClassName, "RemoteFunction") then
				rconsoleprint("\nRemoteFunction found! \nLocation: " .. v:GetFullName() .. "  \nMethod | InvokeServer\n")
			else

			end
		end
	end, 
	shadows = function(...)
		Lighting.GlobalShadows = true
	end, 
	
	noshadows = function(...)
		Lighting.GlobalShadows = false
	end, 

	position = function(...)
    		rconsoleprint(tostring(character.HumanoidRootPart.Position.X .. character.HumanoidRootPart.Position.Y .. character.HumanoidRootPart.Position.Z'\n'))
	end, 
	
	fireclickdetectors = function(...)
		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("ClickDetector") then
				fireclickdetector(v)
			end
		end
	end, 
	
	blockhead = function(...)
		character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
	end, 
	
	blockhats = function(...)
		for _,v in pairs(character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
			for i,c in pairs(v:GetDescendants()) do
				if c:IsA("SpecialMesh") then
					c:Destroy()
				end
			end
		end
	end, 
	
	rejoin = function(...)
		tps:Teleport(game.PlaceId, Player)	
	end, 
	
	blocktool = function(...)
		for _,v in pairs(character:GetChildren()) do
			if v:IsA("Tool") or v:IsA("HopperBin") then
				for i,c in pairs(v:GetDescendants()) do
					if c:IsA("SpecialMesh") then
						c:Destroy()
					end
				end
			end
		end
	end, 
	
	naked = function(...)
		for i, v in pairs(character:GetDescendants()) do
			if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
				v:Destroy()
			end
		end
	end, 
	
	day = function(...)
		Lighting.ClockTime = 14
		rconsolewarn("This is client-side only.")
	end, 

	night = function(...)
		Lighting.ClockTime = 0
		rconsolewarn("This is client-side only.")
	end, 
	
	noface = function(...)
		for i, v in pairs(speaker.Character:GetDescendants()) do
			if v:IsA("Decal") and v.Name == "face" then
				v:Destroy()
			end
		end
	end, 
	
	fullbright = function(...)
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end, 

	nofog = function(...)
		Lighting.FogEnd = 100000

		for i, v in pairs(Lighting:GetDescendants()) do
			if v:IsA("Atmosphere") then
				v:Destroy()
			end
		end

		rconsolewarn('This is client-side only.')
	end, 

	supportserver = function(...)
		rconsoleprint("https://discord.gg/aK6k4HKKjb\n Server link has been copied to your clipboard.\n")
		setclipboard("https://discord.gg/aK6k4HKKjb")
	end, 

	noproximitycooldown = function(...)
		while task.wait() do
			game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(fireproximityprompt)
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
			if getnamecallmethod() == "GetTotalMemoryUsageMb" then
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
	
	joinlogs = function(...)
		local args = {...}

		joinlogsenabled = args[1] or not joinlogsenabled

		if joinlogsenabled then
			joinlogcon = Players.PlayerAdded:Connect(function(plr)
				rconsoleprint("\n" .. plr.Name .. " has joined, account is " .. plr.AccountAge .. " days old!\nInput: ")
			end)

			leavelogcon = Players.PlayerRemoving:Connect(function(plr)
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

		task.wait()

		rconsolewarn('Anything you add or delete using "btools" will be client-side only.')
		
	end, 

	noclip = function(...)
		for i, v in pairs(Workspace[User]:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end, 
	
	clip = function(...)
		for i, v in pairs(Workspace[User]:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
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
	
	serverhop = function(...)
		local x = {}
		local pid = game.PlaceId
		local jid = game.JobId

		for _, v in ipairs(HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. pid .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= jid then
				x[#x + 1] = v.id
			end
		end

		if #x > 0 then
			tps:TeleportToPlaceInstance(pid, x[math.random(1, #x)])
		end
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

	clear = rconsoleclear
}

while task.wait() do
	rconsoleprint("Input: ")

	local args = rconsoleinput()
	local tokens = split(args, " ")

	if tokens[1] ~= nil then
		load_plugins()

		local command = string.lower(tokens[1])
		local getCommand = commands[command]

		table.remove(tokens, 1)

		if getCommand then
			local success = pcall(commands[command], table.unpack(tokens))

			if success then
				rconsoleprint("Executed " .. command .. " successfully!\n", green)
			else
				rconsoleerr("An error occurred while running "  .. command .. "\nPlease report this in the support server if you think this command may be bugged.\n")
			end
		else
			rconsoleerr("Failed to execute " .. command .. "!\nPlease report this in the support server if you think this command may be bugged.\n")
		end
	end
end
