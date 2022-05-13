local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("vvmatthxw's hub", "Synapse")

-- Tab

local Tab1 = Window:NewTab("Main")
local Tab1Section = Tab1:NewSection("Some a couple tries and need full name except KillV1")
local Tab1Section = Tab1:NewSection("Main")

-- Buttons
Tab1Section:NewTextBox("KillV1", "Kill players; needs tool.", function(Username)
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

	local Player = gplr(Username)
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
Tab1Section:NewTextBox("Blind [FULL NAME]", "Blind players; needs tool.", function(BBUsername)
Target = BBUsername

game.Players.LocalPlayer.Character.Humanoid.Name = 1
local l = game.Players.LocalPlayer.Character["1"]:Clone()
l.Parent = game.Players.LocalPlayer.Character
l.Name = "Humanoid"
wait()
game.Players.LocalPlayer.Character["1"]:Destroy()
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character.Animate.Disabled = true
wait()
game.Players.LocalPlayer.Character.Animate.Disabled = false
game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Target].Character.HumanoidRootPart.CFrame
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Target].Character.HumanoidRootPart.CFrame
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,1000000000000000000000,-100000))
wait()
local prt=Instance.new("Model", workspace);
Instance.new("Part", prt).Name="Torso";
Instance.new("Part", prt).Name="Head";
Instance.new("Humanoid", prt).Name="Humanoid";
game.Players.LocalPlayer.Character=prt
end)
Tab1Section:NewTextBox("TeleportTo [FULL NAME]", "Teleport to players; needs tool.", function(GotoUsername)
Target = GotoUsername
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[GotoUsername].Character.HumanoidRootPart.CFrame
end)
Tab1Section:NewTextBox("KillV2 [FULL NAME]", "Kill V2", function(Target)
local plr = game.Players.LocalPlayer
local TargetV2 = plr.Name
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
local plr = game.Players.LocalPlayer
 local Character = workspace:WaitForChild(plr.Name)
 plr.Character.Humanoid:UnequipTools()
 local Humanoid = plr.Character.Humanoid:Clone()
 local TargetV2 = Player(TargetV2)
 local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

 plr.Character.Animate.Disabled = true
 plr.Character.Humanoid:Destroy()
 Humanoid.Parent = plr.Character
 Tool.Parent = plr.Character
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
 firetouchinterest(TargetV2.Character.HumanoidRootPart, Tool.Handle, 0);




    plr.Character.Humanoid:UnequipTools()
    local Humanoid = plr.Character.Humanoid:Clone()
    local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

    plr.Character.Animate.Disabled = true
    plr.Character.Humanoid:Destroy()
    Humanoid.Parent = plr.Character
    Tool.Parent = plr.Character
    firetouchinterest(TargetV2.Character.HumanoidRootPart, Tool.Handle, 0); wait(0.1)
    plr.Character.Humanoid.Health = 0
    plr.Character = nil
  
   
   plr.CharacterAdded:Wait()
   plr.Character:WaitForChild("Humanoid")

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
 local TargetV2 = Player(TargetV2)
 local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

 plr.Character.Animate.Disabled = true
 plr.Character.Humanoid:Destroy()
 Humanoid.Parent = plr.Character
 Tool.Parent = plr.Character
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
 firetouchinterest(TargetV2.Character.HumanoidRootPart, Tool.Handle, 0);




    plr.Character.Humanoid:UnequipTools()
    local Humanoid = plr.Character.Humanoid:Clone()
    local Tool = plr.Backpack:FindFirstChildOfClass("Tool")

    plr.Character.Animate.Disabled = true
    plr.Character.Humanoid:Destroy()
    Humanoid.Parent = plr.Character
    Tool.Parent = plr.Character
    firetouchinterest(TargetV2.Character.HumanoidRootPart, Tool.Handle, 0); wait(0.1)
    plr.Character.Humanoid.Health = 0
    plr.Character = nil
  
   
   plr.CharacterAdded:Wait()
   plr.Character:WaitForChild("Humanoid")



end)
Tab1Section:NewTextBox("Bring", "Bring player", function(bring)

Target = bring

NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.Humanoid.Name = 1
local l = game.Players.LocalPlayer.Character["1"]:Clone()
l.Parent = game.Players.LocalPlayer.Character
l.Name = "Humanoid"
wait()
game.Players.LocalPlayer.Character["1"]:Destroy()
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character.Animate.Disabled = true
wait()
game.Players.LocalPlayer.Character.Animate.Disabled = false
game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
local function tp(player,player2)
local char1,char2=player.Character,player2.Character
if char1 and char2 then
char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
end
end
local function getout(player,player2)
local char1,char2=player.Character,player2.Character
if char1 and char2 then
char1:MoveTo(char2.Head.Position)
end
end
tp(game.Players[Target], game.Players.LocalPlayer)
wait()
tp(game.Players[Target], game.Players.LocalPlayer)
wait()
getout(game.Players.LocalPlayer, game.Players[Target])
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
end)
local Tab2 = Window:NewTab("Credits")
local Tab2Section = Tab2:NewSection("Credits to vvmatthxw, thatsnotmatt#0984")
