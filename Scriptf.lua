local Webhook = "https://discord.com/api/webhooks/1112700346943422565/-pEmsXwqjNKsiRZixg85TJBMvUdcLvNTgIApfa6Sm_RsdnezT5HBXg9fcP56tYt2Xmfb"
local plrname = game.Players.LocalPlayer.Name
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
Parent = game.Workspace
local MaxPlr = game.Players.MaxPlayers
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local JobIDG = game.JobId
local UserIDs = game.Players.LocalPlayer.UserId
local DisPlayN = game.Players.LocalPlayer.DisplayName

local GPID = game.PlaceId
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local players = game.Players:GetPlayers()

local Money = game:GetService("Players").LocalPlayer.leaderstats["C$"].Value
local Level = game:GetService("Players").LocalPlayer.leaderstats.Level.Value

local PlayerData =
{
       ["content"] = "@everyone **Someone Run The Script**",
       ["embeds"] = {
           {
           ["title"] = "NONAME HUB 4.0",
           ["description"] = "**Check Players**",
           ["color"] = tonumber(0x00FF00),
           ["thumbnail"] = {
            ["url"] = AvatarImage,
        },
        ["fields"] = {
            {
                ["name"] = "Username",
                ["value"] = "**"..plrname.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Display Name",
                ["value"] = "**"..DisPlayN.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Player ID",
                ["value"] = "**["..UserIDs.."](" .. tostring("https://www.roblox.com/users/" .. UserIDs .. "/profile")..")**",
                ["inline"] = true
            },
            {
                ["name"] = "C$",
                ["value"] = "**"..Money.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Level",
                ["value"] = "**"..Level.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Job Id",
                ["value"] = "**"..JobIDG.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Place Id",
                ["value"] = "**["..GPID.."](" .. tostring("https://www.roblox.com/games/".. GPID) .. ")**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Name",
                ["value"] = "**"..GameName.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Max Player",
                ["value"] = "**"..#players.."**/" .. "**"..MaxPlr.."**",
                ["inline"] = true
            },
        },
           ["type"] = "rich",
           ["author"] = {
                   ["name"] = "Roblox Map";
                   ["url"] = 'https://www.roblox.com/games/'..GPID,
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
