-- created by iris https://v3rmillion.net/member.php?action=profile&uid=207161

if not getgenv()["Iris"] then getgenv()["Iris"]={}; end
if getgenv()["Iris"]["CustomConsole"] then return else getgenv()["Iris"]["CustomConsole"] = true end
    
local Exploit;
local Seralize =  loadstring(game:HttpGet('https://raw.githubusercontent.com/Teemsploit/SituationAdmin.lua/main/SeralizeTable.lua', true))()
if syn and syn_crypt_derive then
    Exploit = "Synapse" 
elseif gethui and identifyexecutor() == "ScriptWare" then
    Exploit = "ScriptWare" 
end

local CachedFunctions = {
    rconsoleprint = getgenv()["rconsoleprint"],
    rconsolewarn = getgenv()["rconsolewarn"],
    rconsoleerr = getgenv()["rconsoleerr"] or getgenv()["rconsoleerror"],
    rconsoleinfo = getgenv()["rconsoleinfo"],
    rconsoleinput = getgenv()["rconsoleinput"],
}

local SWColors = {
    ["Black"] = true,
    ["red"] = true,
    ["ured"] = true,
    ["bred"] = true,
    ["green"] = true,
    ["ugreen"] = true,
    ["bgreen"] = true,
    ["yellow"] = true,
    ["uyellow"] = true,
    ["byellow"] = true,
    ["blue"] = true,
    ["ublue"] = true,
    ["bblue"] = true,
    ["magenta"] = true,
    ["umagenta"] = true,
    ["bmagenta"] = true,
    ["cyan"] = true,
    ["ucyan"] = true,
    ["bcyan"] = true,
    ["white"] = true,
    ["uwhite"] = true,
    ["bwhite"] = true
}

local SynColors = {
    ["@@BLACK@@"] = true,
    ["@@BLUE@@"] = true,
    ["@@GREEN@@"] = true,
    ["@@CYAN@@"] = true,
    ["@@RED@@"] = true,
    ["@@MAGENTA@@"] = true,
    ["@@BROWN@@"] = true,
    ["@@LIGHT_GRAY@@"] = true,
    ["@@DARK_GRAY@@"] = true,
    ["@@LIGHT_BLUE@@"] = true,
    ["@@LIGHT_GREEN@@"] = true,
    ["@@LIGHT_CYAN@@"] = true,
    ["@@LIGHT_RED@@"] = true,
    ["@@LIGHT_MAGENTA@@"] = true,
    ["@@YELLOW@@"] = true,
    ["@@WHITE@@"] = true
}

local Defaults = {
    rconsoleprint = nil,
    rconsolewarn = nil,
    rconsoleerr = nil,
    rconsoleerror = nil,
    rconsoleinfo = nil,
    rconsoleclear = nil,
    rconsolewritetable = nil,
}

local function FormatData(...)
    local Args = {...}

    for _,Arg in next, Args do 
        if Arg == "
" then
            CachedFunctions.rconsoleprint("
")
        else
            Args[_] = tostring(Arg) 
        end
    end
    local Coloring = select(#Args, ...)

    if not (isconsoleopen and isconsoleopen()) then
        rconsolecreate();
        local SWName, SWVer = identifyexecutor();
        rconsolesettitle(SWName .. " " .. SWVer)
    end

    if SWColors[Coloring] then
        Coloring = SWColors[Coloring]
        table.remove(Args, #Args)
    else
        Coloring = "white"
    end

    return {table.concat(Args, " "), Coloring}
end

local function FormatSynData(...)
    local Args = {...}
    for _,Arg in next, Args do 
        if Arg == "
" then
            CachedFunctions.rconsoleprint("
")
        else
            Args[_] = tostring(Arg) 
        end
    end

    if #Args == 1 and Args[1]:find("@@") then
        if SynColors[Args[1]] then
            return Args[1];
        end
        return "@@WHITE@@"
    end

    return table.concat(Args, " ")
end

local function DoDash(Color)

    CachedFunctions.rconsoleprint("[", "white")
    CachedFunctions.rconsoleprint("*", Color)
    CachedFunctions.rconsoleprint("] ", "white")
end

if Exploit == "Synapse" then
    Defaults.rconsoleprint = function(...)
        local Formatted = FormatSynData(...)
        CachedFunctions.rconsoleprint(Formatted)
    end

    Defaults.rconsolewarn = function(...)
        local Formatted = FormatSynData(...)
        CachedFunctions.rconsolewarn(Formatted)
    end

    Defaults.rconsoleerr = function(...)
        local Formatted = FormatSynData(...)
        CachedFunctions.rconsoleerr(Formatted)
    end
    Defaults.rconsoleerror = Defaults.rconsoleerr;

    Defaults.rconsoleinfo  = function(...)
        local Formatted = FormatSynData(...)
        CachedFunctions.rconsoleinfo(Formatted)
    end

elseif Exploit == "ScriptWare" then
    Defaults.rconsoleprint = function(...)
        local Formatted = FormatData(...)
        CachedFunctions.rconsoleprint(Formatted[1], Formatted[2])
    end

    Defaults.rconsolewarn = function(...)
        local Formatted = FormatData(...)
        DoDash("yellow")
        CachedFunctions.rconsoleprint(Formatted[1], Formatted[2])
        CachedFunctions.rconsoleprint("
")
    end

    Defaults.rconsoleerr = function(...)
        local Formatted = FormatData(...)
        DoDash("red")
        CachedFunctions.rconsoleprint(Formatted[1], Formatted[2])
        CachedFunctions.rconsoleprint("
")
    end
    Defaults.rconsoleerror = Defaults.rconsoleerr;

    Defaults.rconsoleinfo  = function(...)
        local Formatted = FormatData(...)
        DoDash("blue")
        CachedFunctions.rconsoleprint(Formatted[1], Formatted[2])
        CachedFunctions.rconsoleprint("
")
    end
end

for Cache, Literal in next, CachedFunctions do
    Cache = Literal;
end

for FuncName, Function in next, Defaults do
    getgenv()[tostring(FuncName)] = Function;
end

getgenv()["rconsolewritetable"] = function(Table)
    if typeof(Table) ~= "table" then
        return warn("You mus provide a table as the first argument!")
    end
    rconsolewarn(("Table ID: %s "):format(tostring(Table)))
    rconsoleprint(Seralize(Table) or "Failure to seralize")
    rconsoleprint("
")
end
