getgenv().Commands = {}
getgenv().Prefix = "$" -- ONLY space out something like /e so its not like "/egoto <plrname>", Can be a word of your choice for example: ".goto <plrname>"
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

AddCommand("kill", {"murder", "vkill"}, "Killa player", function(args)
   if args[1] then
       local Target = psearch(args[1]) -- Im giving the player finder as a bonus lol
       Notify("zxciaz", "Killing : "..tostring(Target), "", 3)
       if Target and Target.Character then
           local plr = game.Players.LocalPlayer
local Target = plr.Name
local Player = function(Ev)
 if Ev == "" then
  return nil
 elseif Ev == "random" then
  return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
 else
  for _, v in pairs(game:GetService("Players"):GetPlayers()) do
   if v.Name:lower():sub(1, #Ev) == Ev:lower() or v.DisplayName:lower():sub(1, #Ev) == Ev then
    return v
end
end
end
end
local timeLeft = 3
while true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Target].Character.HumanoidRootPart.CFrame
timeLeft = timeLeft - 1
wait(1)
if  timeLeft == 0 then
print("script breaked")
 break
end
end
local plr = game.Players.LocalPlayer
 local Character = workspace:WaitForChild(plr.Name)
 plr.Character.Humanoid:UnequipTools()
 local Humanoid = plr.Character.Humanoid:Clone()
 local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

 plr.Character.Animate.Disabled = true
 plr.Character.Humanoid:Destroy()
 Humanoid.Parent = plr.Character
 Tool.Parent = plr.Character
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
 firetouchinterest(Target.Character.HumanoidRootPart, Tool.Handle, 0);




    plr.Character.Humanoid:UnequipTools()
    local Humanoid = plr.Character.Humanoid:Clone()
    local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

    plr.Character.Animate.Disabled = true
    plr.Character.Humanoid:Destroy()
    Humanoid.Parent = plr.Character
    Tool.Parent = plr.Character
    firetouchinterest(Target.Character.HumanoidRootPart, Tool.Handle, 0); wait(0.1)
    plr.Character.Humanoid.Health = 0
    plr.Character = nil
  
   
   plr.CharacterAdded:Wait()
   plr.Character:WaitForChild("Humanoid")


 local plr = game.Players.LocalPlayer
 local Character = workspace:WaitForChild(plr.Name)
 plr.Character.Humanoid:UnequipTools()
 local Humanoid = plr.Character.Humanoid:Clone()
 local Target = Player(Target)
 local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

 plr.Character.Animate.Disabled = true
 plr.Character.Humanoid:Destroy()
 Humanoid.Parent = plr.Character
 Tool.Parent = plr.Character
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
 firetouchinterest(Target.Character.HumanoidRootPart, Tool.Handle, 0);




    plr.Character.Humanoid:UnequipTools()
    local Humanoid = plr.Character.Humanoid:Clone()
    local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

    plr.Character.Animate.Disabled = true
    plr.Character.Humanoid:Destroy()
    Humanoid.Parent = plr.Character
    Tool.Parent = plr.Character
    firetouchinterest(Target.Character.HumanoidRootPart, Tool.Handle, 0); wait(0.1)
    plr.Character.Humanoid.Health = 0
    plr.Character = nil
  
   
   plr.CharacterAdded:Wait()
   plr.Character:WaitForChild("Humanoid")


end
end
end)
-- Checks if you chatted
LocalP.Chatted:Connect(function(Msg)
   CheckCmd(Msg)
end)
