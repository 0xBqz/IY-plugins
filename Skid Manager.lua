--[[Tools]]
local HttpService = game:GetService("HttpService")
local skids = {}

--[[Plufin json file]]

if isfile("Skids.json") then
    if HttpService:JSONDecode(readfile("Skids.json")).skids ~= nil then skids = json.skids else skids = {} end
else
    writefile("Skids.json","")
end

function AddSkid(name)
    local repet
    for i,v in pairs(skids) do
        if v == name then
            repet = true
        end
    end

    if repet then
        notify("Error "..name.." is not a valid skid","the user "..name.." is already on the skidlist")
    else
        notify("Succes! added "..name.."to the skidlist","added "..name.." to the skidlist. your settings will save")
        table.insert(skids,name)
    end

    writefile("Skids.json", HttpService:JSONEncode({skids = skids}))
end

local function chatnotify(text,color)
    game.StarterGui:SetCore("ChatMakeSystemMessage",{
        Text = text, Color = color
    })
end

local function notifyskid(name)
    for _,plrs in pairs(skids) do
        if plrs == name.Name then
            chatnotify("SKID DETECTED!!!: " ..plrs,Color3.fromRGB(205, 84, 75))
        end
    end
end

for _,plrs in pairs(game.Players:GetPlayers()) do
    notifyskid(plrs)
end

game.Players.PlayerAdded:Connect(function(plr)
    notifyskid(plr)
end)

game.Players.PlayerRemoving:Connect(function(plr)
    chatnotify("the skid: "..plr..", has left the experience",Color3.fromRGB(205, 84, 75))
end)


--[[Plugin table]]
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
                    AddSkid(plr)
                end
            end
        },
        ["skidlist"] = {
            ["ListName"] = "skidlist",
            ["Description"] = "notifies all skids.",
            ["Aliases"] = {""},
            ["Function"] = function(args,speaker)
                notify("Succes! notified all skids","all saved skids are notified in the chat")
                chatnotify(HttpService:JSONEncode(skids))
            end
        },
    }
}

return Plugin
