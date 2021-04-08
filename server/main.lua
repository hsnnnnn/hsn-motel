ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("hsn-motels:setdoorstate")
AddEventHandler("hsn-motels:setdoorstate", function(round, roomLocked)
    TriggerClientEvent("hsn-motels:setdoorstate", -1, round, roomLocked)
end)

ESX.RegisterServerCallback('hsn-motels:getplayeroutfit', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('hsn-motels:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('hsn-motels:removeoutfit')
AddEventHandler('hsn-motels:removeoutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('fizzfau-motel:getplayerdressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)
ESX.RegisterServerCallback('hsn-motels:getidentifier',function(source,cb)
	local src = source
	local player = ESX.GetPlayerFromId(src)
	if player ~= nil then
		cb(player.identifier)
	end
end)

RegisterCommand("getid", function(source)
	local player = ESX.GetPlayerFromId(source)
	print(player.identifier)

end)