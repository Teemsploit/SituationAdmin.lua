# SituationAdmin.lua
A console admin script made for Synapse X and script-ware, currently working on adding temple support.<br>
<p>
May not work on other executors.<br>
you can get Synapse X at https://x.synapse.to/<br>
you can get script-ware at https://script-ware.com/<br>
You can find the support server here https://discord.gg/5VAKhPQh8Z<br>
</p>
<hr>
<p>
<h1>How to use the script</h1>
Situation admin is very easy to use, first you will need an executor for roblox for this we would recommend either 'SynapseX' or 'Script-Ware' the link for both is listed above once you have installed the executor simply copy and paste the code below into your executor and click 'execute'.
Type 'Help' into the console once executed for a list of commands, currently over 30 commands with more coming soon
```lua
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Teemsploit/SituationAdmin.lua/main/admin.lua'),true))()
```
</p>
<p>
<h1>How to add a plugin to situation admin</h1>  
A folder named "situation_plugins" will be created upon execution.<br>
To create a plugin you will need to create a new file such as <command_name>.lua.<br>
Situation admin will treat every lua file within the folder as a function, whatever is inside the file is what is gets ran whenever you execute the command.<br>
The name of the file will be what the command is called for example if the file is named "example.lua" to run the command you would type "command" in the input
</p>

<h1>Warning about a skid</h1>
<p>
There is a skid going around taking our project and needlessly modifying it trying to claim the code has been skidded. He goes by "HoppingShark1437" and he is someone with very little understanding of Lua. Based on past pull requests he has tried to make incompatible changes that conflict with the plugin system, tries to unnecessarily change the splitter by making it work with legacy code even though anyone with half a brain knows to use an up-to-date Lua, and has tried to modify our command lookup from bracket notation to dot notation solely because "it doesn't make sense" (to him anyway) when by changing that, the entire lookup would break.<br>
<br>
This man has tried to say Situation Admin has been skidded, when any outside help has been sourced and credited, including him for his past pull requests. Let me remind you, the base of Situation Admin has been kept exactly as it was in his skid-rip and he has only removed certain commands, despite talking ill of our work.
</p>
