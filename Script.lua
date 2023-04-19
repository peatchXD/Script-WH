local Webhook = "https://discord.com/api/webhooks/1097548811053830175/Mso8HIlHPAf-nxAnUWvSP97XmqTPA4wgpCJ8aOoxFJD0Ui1f1NUCHbgM2LA9m-Kwpm7i"
local plrname = game.Players.LocalPlayer.Name
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local PlayerData =
{
       ["content"] = "@everyone **Someone Run The Script**",
       ["embeds"] = {
           {
           ["title"] = "Name: "..plrname,
           ["description"] = "Execute is: ".. identifyexecutor(),
           ["color"] = tonumber(0x00FF00),
           ["fields"] = {
               {
                   ["name"] = "Game Job ID: ",
                   ["value"] = game.JobId,
                   ["inline"] = true
                },
           },
           ["author"] = {
                   ["name"] = "Roblox Map";
                   ["url"] = 'https://www.roblox.com/games/'..game.PlaceId,
                        },
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
