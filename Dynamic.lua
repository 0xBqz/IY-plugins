local Data = {}

local Plugin = {}
Plugin["PluginName"] = "Dynamic.iy"
Plugin["PluginDescription"] = "Changes randomly the IY title to make things more dinamic!"
Plugin["Commands"] = {}

Data["Emojis"] = {
    "😎",
    "✨",
    "✨",
    "✨",
    "🎃",
    "💖",
    "🍕",
    "🍔",
    "🍗",
    "🌳",
    "🍄",
    "🍎",
    "🎈",
    "⏰",
    "📞",
    "📷",
    "💍",
    "🎄",
    "🎁",
}

Data["Titles"] = {
    "Infinite Yield",
    "Infinite Yield :)",
    "Infinite Yoild",
    "Yield Infinite",
    "Yield Hub",
    "Yield-Ware",
    "IY",
    "Toon For owner!",
    "Toon's Admin",
    "Inf yeeeeeeeeeeeeeeeld",
    "iiiyyy"
}

Title.Text = Data.Emojis[math.random(1,#Data["Emojis"])].." "..Data.Titles[math.random(1,#Data["Titles"])] .." "..Data.Emojis[math.random(1,#Data["Emojis"])]

return Plugin
