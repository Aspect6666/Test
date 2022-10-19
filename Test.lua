local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("MH+ Scripts", "DarkTheme")
local Tab = Window:NewTab("Rebirth")
local Section = Tab:NewSection("Rebirth")
--Rebirth
Section:NewButton("Rebirth", "ButtonInfo", function()
game:GetService("ReplicatedStorage").resources.remotes.remote_functions.rebirth:InvokeServer()
end)
--Layout
Section:NewButton("Layout", "ButtonInfo", function()
    local ohString1 = "Load"
local ohString2 = "Layout2"

game:GetService("ReplicatedStorage").resources.remotes.remote_functions.layouts:InvokeServer(ohString1, ohString2)
end)
--No Timer
local Tab = Window:NewTab("No Timer")
--No Timer Auto rebirth
local Section = Tab:NewSection("No Timer Auto loadout")
Section:NewToggle("No Timer Rebirth", "", function(v)
    getgenv().autoopen = v
    while true do
        if not getgenv().autoopen then return end
        game:GetService("ReplicatedStorage").resources.remotes.remote_functions.rebirth:InvokeServer()
        wait(0.5)
    end
end)
--No Timer Auto loadout
Section:NewToggle("No Timer loadout", "", function(v)
    getgenv().autoopen = v
    while true do
        if not getgenv().autoopen then return end
        local ohString1 = "Load"
local ohString2 = "Layout2"

game:GetService("ReplicatedStorage").resources.remotes.remote_functions.layouts:InvokeServer(ohString1, ohString2)
    wait(1.5)
    end
end)
--push
local Tab = Window:NewTab("Push")
local Section = Tab:NewSection("Push")
--unbox 100 mag boxes
Section:NewButton("Unbox 100 Mag Boxes", "ButtonInfo", function()
local ohString1 = "Magnificent"
local ohNumber2 = 100

game:GetService("ReplicatedStorage").resources.remotes.remote_functions.mystery_box_multi:InvokeServer(ohString1, ohNumber2)
end)
