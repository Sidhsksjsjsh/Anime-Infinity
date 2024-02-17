local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - Beta Script, more feature soon")
local workspace = game:GetService("Workspace")
local T1 = wndw:Tab("Main")

local function Children(trg,func)
for i,v in pairs(trg:GetChildren()) do
  func(i,v)
  end
end

local function callRemote(args)
  game:GetService("ReplicatedStorage")["Events"]["To_Server"]:FireServer(args)
end

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
