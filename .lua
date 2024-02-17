local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - Beta Script, more feature soon")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")
local egg = {}
local excEnemy = ""
local Codes = {
  "Update4",
  "1M",
  "500K",
  "5Kmembers",
  "Update3.5",
  "Potions2",
  "3000FAV",
  "4000FAV",
  "3000LIKES",
  "NewPlayer",
  "300FAV",
  "400FAV",
  "Likes500",
  "Release",
  "Update1",
  "Update2",
  "Potions",
  "2000FAV",
  "1000Likes",
  "250KVisits",
  "7000Players",
  "1500FAV",
  "1500Likes",
  "Weekend"
}

local function Children(trg,func)
for i,v in pairs(trg:GetChildren()) do
  func(i,v)
  end
end

local function callRemote(args)
  ReplicatedStorage["Events"]["To_Server"]:FireServer(args)
end
--ReplicatedStorage.Models.Eggs

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

T1:Toggle("Auto kill [ Hit first ]",false,function(value)
    _G.kills = value
  while wait() do
      if _G.kills == false then break end
      callRemote({["Info"] = {["Id"] = excEnemy},["Action"] = "Mouse_Click"})
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

T1:Button("Redeem all codes",function()
    for array = 1,#Codes do
      callRemote({["Action"] = "Redeem_Code",["Text"] = Codes[array]})
    end
end)

T2:Dropdown("Select eggs",egg,function(value)
    _G.eggname = value
end)

T2:Toggle("Auto hatch",false,function(value)
    _G.hts = value
    while wait() do
      if _G.hts == false then break end
      callRemote({["Max"] = true,["Action"] = "Egg",["Name"] = _G.eggname})
    end
end)

lib:HookFunction(function(method,self,args)
    if method == "FireServer" and self == "To_Server" and _G.kills == true then
      excEnemy = args[1]["Info"]["Id"]
    end
end)
