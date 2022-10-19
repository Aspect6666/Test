if game.PlaceId == 9103460924 then
    local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local player = game.Players.LocalPlayer
    local char = player.Character
    local hum = char.Humanoid
    hum.UseJumpPower = true
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local window = OrionLib:MakeWindow({Name = GameName, HidePremium = false, IntroEnabled = false, IntroText = "Welcome!", SaveConfig = true, ConfigFolder = "OrionTest"})

-- Defualt walkspeed/jumppower

local defaults = {
    walkspeed = hum.WalkSpeed,
    jumppower = hum.JumpPower
}

---------------------------------------

local old = nil
old = hookmetamethod(hum, '__index', newcclosure(function(slf, idx)
    if slf == hum and not checkcaller() then
        if tostring(idx) == "WalkSpeed" then
            return defaults.walkspeed
        elseif tostring(idx) == "JumpPower" then
            return defaults.jumppower
        end
    end
    return old(slf, idx)
end))

-- Tabs

local tab1 = window:MakeTab {
    Name = "Local"
}

local tab2 = window:MakeTab {
    Name = "Teleport"
}
---------------------------------------

tab1:AddLabel("LocalPlayer")

tab1:AddSlider {
    Name = "WalkSpeed",
    Min = defaults.walkspeed,
    Max = 100,
    Default = defaults.walkspeed,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "Velocity",
    Callback = function(val)
        hum.WalkSpeed = val
    end
}

tab1:AddSlider {
    Name = "JumpPower",
    Min = defaults.jumppower,
    Max = 100,
    Default = defaults.jumppower,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "Height",
    Callback = function(val)
        hum.JumpPower = val
    end
}

---------------------------------------

tab2:AddLabel("Teleport")

Drop = tab2:AddDropdown({
	    Name = "Areas",
	    Default = "Noob Island",
	    Options = {"Noob Island", "Magma Hills", "Sand Canyons", "Poisoned Cove", "Icy Planes", "Plasma Ruins", "Graveyard"},
	    Callback = function(value)
	    end    
})


tab2:AddButton {
	Name = "Click To Tp",
	Callback = function()
        local args = {
		    [1] = game:GetService("ReplicatedStorage").Data[game.Players.LocalPlayer.Name].Stats,
		    [2] = workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Base"),
		    [3] = game.Players.LocalPlayer.Name,
		    [4] = Drop.Value}
        game:GetService("ReplicatedStorage").Events.ToMap:FireServer(unpack(args))
  	end    
}
end


---------------------------------------
