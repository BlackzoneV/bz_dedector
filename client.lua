--BLACKZONE -> fivemsociety.com
ESX = nil
PlayerData = {}

getweapon = {
	'WEAPON_PISTOL',
	'WEAPON_COMBATPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_SNSPISTOL',
	'WEAPON_SNSPISTOL_MK2',
	'WEAPON_PISTOL_MK2',
	'WEAPON_PISTOL50',
	'WEAPON_DOUBLEACTION',
	'WEAPON_REVOLVER',
	'WEAPON_MARKSMANPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_SWITCHBLADE',
	'WEAPON_KNIFE',
	'WEAPON_DAGGER',
	'WEAPON_HAMMER',
	'WEAPON_KNUCKLE',
	'WEAPON_HATCHET',
	'WEAPON_BATTLEAXE',
	'WEAPON_WRENCH',
}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)

local playerData = ESX.GetPlayerData()
	for i=1, #playerData.inventory, 1 do
		for _,v in pairs(getweapon) do
	if playerData.inventory[i].name == v then
		weapons = playerData.inventory[i].count
		silahyokla()
				break
			end
			end
		end
	end
end)


function silahyokla()
local ped = PlayerPedId()
local pedcoords = GetEntityCoords(ped)

if PlayerData.job ~= nil and PlayerData.job.name ~= "police" and PlayerData.job.name ~= "sheriff" then

	local dist = GetDistanceBetweenCoords(pedcoords, 441.04, -989.28, 30.69, true)

	if dist <= 1.5 then
		if weapons > 0 then
			TriggerEvent('notification', 'Üzerinde illegal metal alet var!', 2)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "detector", 0.4)
		end
	end
end

end
