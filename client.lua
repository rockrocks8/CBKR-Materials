local CBKRPed

-- Remove ped model on resource stop.

local function RemoveCBKRPed()
    if DoesEntityExist(CBKRPed) then
        DeletePed(CBKRPed)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() == resourceName then
        RemoveCBKRPed()
	end
end)

-- Target and ped model

CreateThread(function()
    if Config.UseBlip then
        local MaterialsBlip = AddBlipForCoord(Config.Location.Coords)
        SetBlipSprite (MaterialsBlip, Config.Location.SetBlipSprite)
        SetBlipDisplay(MaterialsBlip, Config.Location.SetBlipDisplay)
        SetBlipScale  (MaterialsBlip, Config.Location.SetBlipScale)
        SetBlipAsShortRange(MaterialsBlip, true)
        SetBlipColour(MaterialsBlip, Config.Location.SetBlipColour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Location.BlipName)
        EndTextCommandSetBlipName(MaterialsBlip)
    end
    local Coords = Config.Location.Coords
    local PedHash = Config.Location.ModelHash
    local PedModel = Config.Location.ModelName
    if not DoesEntityExist(CBKRPed) then
        RequestModel( GetHashKey(PedModel) )
        while ( not HasModelLoaded( GetHashKey(PedModel) ) ) do
            Wait(1)
        end
        CBKRPed = CreatePed(1, PedHash, Coords, true, true)
        FreezeEntityPosition(CBKRPed, true)
        SetEntityInvincible(CBKRPed, true)
        SetBlockingOfNonTemporaryEvents(CBKRPed, true)
    end
    exports['qb-target']:AddTargetEntity(CBKRPed, {
        options = {
            {
                num = 1,
                type = "client",
                event = "CBKR-Materials:OpenShop",
                label = Config.Text["TargetLabel"],
                icon = Config.Icons["Eyeicon"],
            }
        },
        distance = 1.5
    })
end)

-- qb-menu

RegisterNetEvent('CBKR-Materials:OpenShop', function()
    local Materials = {
        {
            header = Config.Text['PedHeader'],
            isMenuHeader = true,
            icon = Config.Icons["Header"]
        },
        {
            header = Config.Text['Rare'],
            icon = Config.Icons['Rare'],
            params = {
                event = "CBKR-Materials:RareShop",
            }
        },
        {
            header = Config.Text['Miscellanceous'],
            icon = Config.Icons['Miscellanceous'],
            params = {
                event = "CBKR-Materials:MiscellanceousShop",
            }
        },
    }
    exports['qb-menu']:openMenu(Materials)
end)

-- Materials Shop Event
RegisterNetEvent("CBKR-Materials:RareShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.RareShop)
end)

RegisterNetEvent("CBKR-Materials:MiscellanceousShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.MiscellanceousShop)
end)
