local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - Beta Script, more feature soon")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")
local egg = {}
local excEnemy = ""
local luck = 9e9
local task = ""
local zoneUnlock = 0
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
  "Weekend",
  "Update7",
  "6000FAV",
  "Hero",
  "5000Likes",
  "Update6",
  "5500FAV",
  "Silver",
  "RAIDS",
  "Grimoires"
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

T1:Toggle("Auto click / gain powers ( 1X powers )",false,function(value)
    _G.gp1x = value
    while wait() do
      if _G.gp1x == false then break end
      callRemote({["Action"] = "Mouse_Click"})
    end
end)

T1:Toggle("Auto click / gain powers ( 2X powers )",false,function(value)
    _G.gp = value
    while wait() do
      if _G.gp == false then break end
      callRemote({["Action"] = "Mouse_Click",["Zone"] = workspace["Benches"]:FindFirstChild("Zone x2")["Zone_1"]})
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

T1:Toggle("Auto claim hourly rewards",false,function(value)
    _G.DailyAct = value
    while wait() do
      if _G.DailyAct == false then break end
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 1})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 2})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 3})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 4})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 5})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 6})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 7})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 8})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 9})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 10})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 11})
      callRemote({["Action"] = "Hourly_Rewards",["Id"] = 12})
    end
end)

T1:Toggle("Auto level up",false,function(value)
    _G.lvl = value
    while wait() do
      if _G.lvl == false then break end
      callRemote({["Action"] = "Powers",["Name"] = "Level"})
    end
end)

T1:Toggle("Auto claim quest",false,function(value)
    _G.miss = value
    while wait() do
      if _G.miss == false then break end
      callRemote({["Id"] = task,["Type"] = "Complete",["Action"] = "Quest"})
    end
end)

T1:Toggle("Auto unlock next zone",false,function(value)
    _G.wof = value
    while wait() do
      if _G.wof == false then break end
      callRemote({["Action"] = "ZonePurchase",["Id"] = zoneUnlock})
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

T2:Toggle("Auto hatch stands",false,function(value)
    _G.htss = value
    while wait() do
      if _G.htss == false then break end
      callRemote({["Luck"] = luck,["Action"] = "Powers",["Name"] = "Stands"})
    end
end)

T2:Toggle("Auto hatch curses",false,function(value)
    _G.htc = value
    while wait() do
      if _G.htc == false then break end
      callRemote({["Luck"] = luck,["Action"] = "Powers",["Name"] = "Curses"})
    end
end)

T2:Toggle("Auto hatch sword",false,function(value)
    _G.htw = value
    while wait() do
      if _G.htw == false then break end
      callRemote({["Open_Amount"] = 1,["Luck"] = luck,["Name"] = "Weapons_1",["Action"] = "Gacha_Activate"})
    end
end)

T2:Toggle("Auto hatch rare/secret star eggs 1 ( Resource )",false,function(value)
    _G.htse1 = value
    while wait() do
      if _G.htse1 == false then break end
      callRemote({["Selected"] = {"Collector_Star_1"},["Action"] = "Use",["Category"] = "Resources"})
    end
end)

T2:Toggle("Auto hatch rare/secret star eggs 2 ( Resource )",false,function(value)
    _G.htse2 = value
    while wait() do
      if _G.htse2 == false then break end
      callRemote({["Selected"] = {"Collector_Star_2"},["Action"] = "Use",["Category"] = "Resources"})
    end
end)

lib:HookFunction(function(method,self,args)
    if method == "FireServer" and self == "To_Server" and _G.kills == true then
      excEnemy = args[1]["Info"]["Id"]
    elseif method == "FireServer" and self == "To_Server" and args[1]["Type"] == "Accept" and args[1]["Action"] == "Quest" then
      task = args[1]["Id"]
    elseif method == "FireServer" and self == "To_Server" and args[1]["Action"] == "ZonePurchase" then
      zoneUnlock = args[1]["Id"] + 1
    end
end)
