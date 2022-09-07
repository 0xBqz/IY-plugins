
local HttpService = game:GetService("HttpService")
local skids = {}

if isfile("Skids.json") then
    if HttpService:JSONDecode(readfile("Skids.json")) ~= nil then skids = HttpService:JSONDecode(readfile("Skids.json")) else skids = {} end else writefile("Skids.json","{}")
end

local function notifyskid(name)
    for _,plrs in pairs(skids) do
        if plrs == name.Name then
            game.StarterGui:SetCore("ChatMakeSystemMessage",{
                ["Text"] = "SKID DETECTED!!!: " ..plrs,
                ["Color"] = Color3.fromRGB(205, 84, 75)
            })
        end
    end
end

for _,plrs in pairs(game.Players:GetPlayers()) do
    notifyskid(plrs)
end

game.Players.PlayerAdded:Connect(function(plr)
    notifyskid(plr)
end)

local Plugin = {
    ["PluginName"] = "Skid's manager",
    ["PluginDescription"] = "helps u managing the skids, added by you.",
    ["Commands"] = {
        ["skid"] = {
            ["ListName"] = "skid/addskid [plr]",
            ["Description"] = "adds skid to the skid list, your settings will save",
            ["Aliases"] = {"addskid"},
            ["Function"] = function(args,speaker)
                for _,plr in pairs(getPlayer(args[1],speaker)) do
                    if not FindInTable(skids, plr) and Players.LocalPlayer.Name ~= plr then
                        notify("Succes! added "..plr.."to the skidlist","added "..plr.." to the skidlist. your settings will save")
                        table.insert(skids,plr)

                        writefile("Skids.Json",HttpService:JSONEncode(skids))
                    else
                        notify("Invalid argument",plr.." is not a valid player to add in the skidlist.")
                    end
                end
            end
        },
        ["skidlist"] = {
            ["ListName"] = "skidlist",
            ["Description"] = "notifies all skids.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                notify("Succes! notified all skids","all saved skids are notified in the chat")
                game.StarterGui:SetCore("ChatMakeSystemMessage",{
                    ["Text"]  =  HttpService:JSONEncode(skids),
                    ["Color"] = Color3.fromRGB(205, 84, 75)
                })
            end
        },
    }
}

return Plugin
