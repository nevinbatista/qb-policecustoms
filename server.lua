local QBCore = exports['qb-core']:GetCoreObject()

-- Server-side check for menu access
QBCore.Functions.CreateCallback('qb-policecustoms:checkJob', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job.name == "police" then
        cb(true)
    else
        cb(false)
    end
end)