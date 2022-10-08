if rconsoleprint == nil then
    print("Your exploit is not supported!")
    return
end

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
    teleport = function(...)
        for i, plr in ipairs(Players:GetPlayers()) do
            rconsoleprint(i .. ".) " .. plr.Name .. "\n")
        end

        rconsoleprint("Choice: ")

        playerNum = tonumber(rconsoleinput())
        plrchar = game:GetService("Players"):GetPlayers()[playerNum].Character
         --
        --[[ if playerNum == nil then
            nexthandler()
            else ]] getroot(character).CFrame =
            getroot(plrchar).CFrame
        -- end
    end, 
	
    bitchcount = function(...)
        rconsolewarn("You have " .. math.random(1, 100) .. " bitches")
    end, 
	
    btools = function(...)
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
	
    funfact = function(...)
        rconsoleprint(
            game:GetService("HttpService"):JSONDecode(
                game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")
            ).text
        )
        rconsoleprint("\n")
    end, 
	
	avatar = function(...)
		local args = {...}
		local id = args[1]

		game.Players.LocalPlayer.CharacterAppearance = "https://api.roblox.com/v1.1/avatar-fetch/?".. game.PlaceId .."=0&userId=" .. id

		rconsolewarn('This is client-side only!')
		rconsoleprint('\n')
	end, 
	
    serverhop = function(...)
        local x = {}
        for _, v in ipairs(
            game:GetService("HttpService"):JSONDecode(
                game:HttpGetAsync(
                    "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                )
            ).data
        ) do
            if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
                x[#x + 1] = v.id
            end
        end
        if #x > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
        end
    end, 
	
    antiafk = function(...)
        for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
            v:Disable()
        end
    end, 
    
	chat = function(...)
		local args = {...}
		local Message = args[1]

		local storage = game:GetService("ReplicatedStorage")

		if storage:FindFirstChild("DefaultChatSystemChatEvents") then
			storage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, "All")
		else
			rconsolewarn("It seems this game has a custom chat this command will not work.")
		end
	end, 
	
	noclip = Humanoid:ChangeState(11), 
	clear = rconsoleclear
}

function nexthandler()
    rconsoleprint("@@WHITE@@")
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

        rconsoleprint("@@GREEN@@")
        rconsoleprint("Executed " .. command .. " successfully!\n")
    else
        rconsoleerr("Failed to execute " .. command .. "!\n")
    end

    nexthandler()
end

nexthandler()
