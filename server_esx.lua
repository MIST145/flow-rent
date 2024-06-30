local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('flow-rent:giveMoney')
AddEventHandler('flow-rent:giveMoney', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addMoney(Config.RefundFee)
end)

RegisterServerEvent('flow-rent:removeMoney')
AddEventHandler('flow-rent:removeMoney', function (carPrice)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerMoney = xPlayer.getMoney()
    
    if playerMoney < carPrice then
        TriggerClientEvent("flow-rent:removeCar", src)
        TriggerClientEvent("flow-rent:enoughMoney", src)
    else 
        xPlayer.removeMoney(carPrice)
    end
end)
