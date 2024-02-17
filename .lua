local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - Beta Script, more feature soon")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")
local egg = {}

local function Children(trg,func)
for i,v in pairs(trg:GetChildren()) do
  func(i,v)
  end
end

local function callRemote(args)
  ReplicatedStorage["Events"]["To_Server"]:FireServer(args)
end

lib:AddTable(ReplicatedStorage["Models"]["Eggs"],egg)

T1:Toggle("Auto kill [ All ]",false,function(value)
    _G.kill = value
  while wait() do
      if _G.kill == false then break end
      Children(workspace["Debris"]["Monsters"],function(i,v)
          callRemote({["Info"] = {["Id"] = v.Name},["Action"] = "Mouse_Click"})
      end)
  end
end)

T1:Toggle("Auto click / gain powers",false,function(value)
    _G.gp = value
    while wait() do
      if _G.gp == false then break end
      callRemote({["Action"] = "Mouse_Click"})
    end
end)

T1:Button("Claim group chest",function()
    callRemote({["Action"] = "Chest_Claim",["Name"] = "Group"})
end)

T2:Dropdown("Select eggs",{"1","2"},function(value)
    _G.eggname = value
end)

T2:Toggle("Auto hatch",false,function(value)
    _G.hts = value
    while wait() do
      if _G.hts == false then break end
      callRemote({["Max"] = true,["Action"] = "Egg",["Name"] = _G.eggname})
    end
end)
