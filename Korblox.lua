
local Plugin = {
    ["PluginName"] = "Fake Korblox.iy",
    ["PluginDescription"] = "use korblox/fakekorblox to use (toggle)",
    ["Commands"] = {
        ["korblox"] = {
            ["ListName"] = "korblox/fakekorblox",
            ["Description"] = "respawn for prision life",
            ["Aliases"] = {"fakekorblox"},
            ["Function"] = function(args,speaker)
            	korblox = not korblox
				notify("Toggled the fake korblox","set to "..tostring(korblox).." (refresh to get changes)")
				
            end
        },
    }
}

game.Players.LocalPlayer.CharacterAdded:Connect(function()
	if korblox then
		wait(0.1)
		game:GetService'Players'.LocalPlayer.Character['Right Leg']:Destroy()
		
		Height = "2" 
		leg = game:GetService("Players").LocalPlayer.Character
	end
end)

return Plugin
