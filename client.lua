local QBCore = exports['qb-core']:GetCoreObject()

-- Function to check if vehicle supports a mod
local function GetModCount(vehicle, modType)
    if modType == "extras" then
        local count = 0
        for i = 1, 14 do
            if DoesExtraExist(vehicle, i) then
                count = count + 1
            end
        end
        return count
    else
        return GetNumVehicleMods(vehicle, modType)
    end
end

-- Function to get mod label
local function GetModLabel(vehicle, modType, modIndex)
    if modType == "extras" then
        return "Extra " .. modIndex
    else
        return GetModTextLabel(vehicle, modType, modIndex) or ("Mod " .. modIndex)
    end
end

-- Open main customization menu
local function OpenCustomsMenu()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then return end

    SetVehicleModKit(vehicle, 0)
    local menu = {
        { header = "Police Vehicle Customs", txt = "Customize your vehicle", isMenuHeader = true }
    }

    for _, mod in ipairs(Config.ModTypes) do
        local modCount = GetModCount(vehicle, mod.modType)
        if modCount > 0 then
            table.insert(menu, {
                header = mod.name,
                txt = "Available: " .. modCount,
                params = {
                    event = "qb-policecustoms:openModSubMenu",
                    args = { modType = mod.modType, label = mod.label, name = mod.name }
                }
            })
        end
    end

    exports['qb-menu']:openMenu(menu)
end

-- Open submenu for specific mod type
RegisterNetEvent('qb-policecustoms:openModSubMenu', function(data)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then return end

    local submenu = {
        { header = data.name, txt = "Select a modification", isMenuHeader = true }
    }

    if data.modType == "extras" then
        for i = 1, 14 do
            if DoesExtraExist(vehicle, i) then
                local enabled = IsVehicleExtraTurnedOn(vehicle, i)
                table.insert(submenu, {
                    header = "Extra " .. i,
                    txt = enabled and "Enabled" or "Disabled",
                    params = {
                        event = "qb-policecustoms:toggleExtra",
                        args = { extraId = i }
                    }
                })
            end
        end
    else
        local modCount = GetNumVehicleMods(vehicle, data.modType)
        for i = -1, modCount - 1 do
            table.insert(submenu, {
                header = GetModLabel(vehicle, data.modType, i),
                txt = "Apply this mod",
                params = {
                    event = "qb-policecustoms:applyMod",
                    args = { modType = data.modType, modIndex = i }
                }
            })
        end
    end

    exports['qb-menu']:openMenu(submenu)
end)

-- Apply vehicle mod
RegisterNetEvent('qb-policecustoms:applyMod', function(data)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then return end
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, data.modType, data.modIndex, false)
end)

-- Toggle vehicle extra
RegisterNetEvent('qb-policecustoms:toggleExtra', function(data)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then return end
    local enabled = IsVehicleExtraTurnedOn(vehicle, data.extraId)
    SetVehicleExtra(vehicle, data.extraId, enabled and 1 or 0)
end)

-- Create qb-target zone
Citizen.CreateThread(function()
    exports['qb-target']:AddCircleZone("policeCustoms", Config.CustomsLocation.coords, Config.CustomsLocation.radius, {
        name = "policeCustoms",
        debugPoly = false,
        useZ = true
    }, {
        options = {
            {
                type = "client",
                event = "qb-policecustoms:openMenu",
                icon = "fas fa-wrench",
                label = "Customize Vehicle",
                job = { ["police"] = 0 },
                canInteract = function()
                    local ped = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local isPoliceVehicle = vehicle ~= 0 and IsVehicleModel(vehicle, Config.PoliceVehicles)
                    return isPoliceVehicle and QBCore.Functions.GetPlayerData().job.name == "police"
                end
            }
        },
        distance = 2.5
    })
end)

-- Event to open main menu
RegisterNetEvent('qb-policecustoms:openMenu', function()
    QBCore.Functions.TriggerCallback('qb-policecustoms:checkJob', function(hasJob)
        if hasJob then
            OpenCustomsMenu()
        else
            QBCore.Functions.Notify("You are not authorized to use this menu!", "error")
        end
    end)
end)