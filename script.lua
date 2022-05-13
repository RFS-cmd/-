getgenv().Commands = {}
getgenv().Prefix = "!" -- ONLY space out something like /e so its not like "/egoto <plrname>", Can be a word of your choice for example: ".goto <plrname>"
getgenv().AddCommand = function(CmdName, CmdAlias, Desc, Func)
   Commands[#Commands + 1] = {
       ["Name"] = CmdName;
       ["Alias"] = CmdAlias;
       ["Description"] = Desc;
       ["Function"] = Func;
   }
end

getgenv().Search = function(CmdName)
   for _, v in pairs(Commands) do
       if v.Name == CmdName or table.find(v.Alias, CmdName) then  
           return v.Function
       end -- Find the command name and returns it Alias (second name) or just name
   end
end

getgenv().CheckCmd = function(Cmd)
   Cmd = string.lower(Cmd)
   if Cmd:sub(1, #Prefix) == Prefix then
       local args = string.split(Cmd:sub(#Prefix + 1), " ") -- Makes shit less hard
       getgenv().CmdName = Search(table.remove(args, 1)) -- Searches for the command
       if CmdName and args then
           return CmdName(args) -- basically execution
       end
   end
end

getgenv().psearch = function(Name)
   for _, p in pairs(game:GetService("Players"):GetPlayers()) do
       if string.lower(string.sub(p.Name, 1, string.len(Name))) == string.lower(Name) then
           return p -- This is a bonus for beginners
       end
   end
end

getgenv().Notify = function(title, text, icon, time)
   game.StarterGui:SetCore("SendNotification",{
       Title = title;
       Text = text;
       Icon = icon;
       Duration = time;
   }) -- This is a bonus
end
local LocalP = game:GetService("Players").LocalPlayer -- So i dont have to type it out
-- Examples   Change these to what you want
AddCommand("ws", {"walkspeed", "speed"}, "Sets Your WalkSpeed", function(args)
   if args[1] then -- This is not neccessary
       LocalP.Character.Humanoid.WalkSpeed = args[1]
   end
   Notify("zxciaz", "WalkSpeed: "..tonumber(args[1]), "", 3) -- Notifies you of the command or whatever
end)

AddCommand("kill", {"death", "vkill"}, "Teleports your to a player", function(args)
   if args[1] then
       local Target = psearch(args[1]) -- Im giving the player finder as a bonus lol
       Notify("zxciaz", "Teleporting To: "..tostring(Target), "", 3)
local lp = game:GetService("Players").LocalPlayer
 
local function gplr(String)
	local Found = {}
	local strl = String:lower()
	if strl == "all" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			table.insert(Found,v)
		end
	elseif strl == "others" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= lp.Name then
				table.insert(Found,v)
			end
		end 
	elseif strl == "me" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name == lp.Name then
				table.insert(Found,v)
			end
		end 
	else
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #String) == String:lower() then
				table.insert(Found,v)
			end
		end 
	end
	return Found 
end

	local Player = gplr(Target)
	if Player[1] then
		Player = Player[1]
          LocalPlayer = game.Players.LocalPlayer
          
         if LocalPlayer.Character.PrimaryPart ~= nil then
                local Character = LocalPlayer.Character
                local previous = LocalPlayer.Character.PrimaryPart.CFrame
                
                Character.Archivable = true
                local Clone = Character:Clone()
                LocalPlayer.Character = Clone
                wait(0.5)
                LocalPlayer.Character = Character
                wait(0.2)
                
                if LocalPlayer.Character and Player.Character and Player.Character.PrimaryPart ~= nil then
                    if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
                    end
    
                    local Humanoid = Instance.new("Humanoid")
                    Humanoid.Parent = LocalPlayer.Character
    
                    local Tool = nil
    
                    if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    elseif LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
                        Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    end
                    print(Tool)

                    if Tool ~= nil then
                        Tool.Parent = LocalPlayer.Backpack
                        
                        Player.Character.HumanoidRootPart.Anchored = true
                        
                        local Arm = game.Players.LocalPlayer.Character['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                        Tool.Grip = Arm:ToObjectSpace(Player.Character.PrimaryPart.CFrame):Inverse()
                        
                        Tool.Parent = LocalPlayer.Character
                        Workspace.CurrentCamera.CameraSubject = Tool.Handle
              
                        repeat
                            wait()
                        until not Tool or Tool and (Tool.Parent == Workspace or Tool.Parent == Player.Character)
                        Player.Character.HumanoidRootPart.Anchored = false
                        wait(0.1)
                        Humanoid.Health = 0
                        LocalPlayer.Character = nil
                    end
                end
     
                spawn(function()
                LocalPlayer.CharacterAdded:Wait()
                Player.Character.HumanoidRootPart.Anchored = false
                if Player.Character.Humanoid.Health <= 15 then
                 notif("The requested user has been killed!")
                repeat wait() until LocalPlayer.Character.PrimaryPart ~= nil
                wait(0.4)
                LocalPlayer.Character:SetPrimaryPartCFrame(previous)
              end
           end)
       end
    end
end)

-- Checks if you chatted
LocalP.Chatted:Connect(function(Msg)
   CheckCmd(Msg)
end)
