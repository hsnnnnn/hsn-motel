ESX = nil





Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
    markerscheck()
    owner = ESX.GetPlayerData().identifier
end)



local hashcode = {
    [1] =   GetHashKey("gabz_pinkcage_doors_front")
}

Citizen.CreateThread(function()
	if Hsn.ShowBlips == true then
	for k,v in pairs(Hsn.MotelKo) do
		
		local blip = AddBlipForCoord(v.x,v.y,v.z)

		SetBlipSprite (blip, 475)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.75)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Motel')
		EndTextCommandSetBlipName(blip)
	end
end

end)

RegisterCommand("motelfix", function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	if GetInteriorFromEntity(ped) ~= 0 then
		local distance = #(coords - vector3(326.5104, -213.300, 54.082))
		print(distance)
		if distance < 35.0 then
			SetEntityCoords(ped, 326.5104, -213.300, 54.082)
		end
	end
end)

local motels = {
		[1] =  {['label'] = "Pink Cage Motel",['no'] = "1", ['x'] = 307.58,['y'] = -213.49,['z'] = 54.22,['h'] =68.9096, ['stashx'] = 306.97,['stashy'] = -208.62,['stashz'] = 54.23,['clothesx'] = 302.38,['clothesy'] = -207.32, ['clothesz'] = 54.23,['obj'] = nil ,['locked'] = true},
		[2] =  {['label'] = "Pink Cage Motel",['no'] = "2", ['x'] = 311.33,['y'] = -203.34,['z'] = 54.22,['h'] =68.9096,['stashx'] = 310.59,['stashy'] = -198.64,['stashz'] = 54.23, ['clothesx'] = 305.95,['clothesy'] = -197.48, ['clothesz'] = 54.23,['obj'] = nil,['locked'] = true },
		[3] =  {['label'] = "Pink Cage Motel",['no'] = "3", ['x'] = 315.75,['y'] = -194.84,['z'] = 54.23,['h'] =338.946,['stashx'] = 320.48,['stashy'] = -194.15,['stashz'] = 54.23, ['clothesx'] = 321.73,['clothesy'] = -189.72, ['clothesz'] = 54.23,['obj'] = nil,['locked'] = true },
		[4] =  {['label'] = "Pink Cage Motel",['no'] = "4", ['x'] = 314.94,['y'] = -219.59,['z'] = 58.02,['h'] =158.946,['stashx'] = 310.21,['stashy'] = -220.27,['stashz'] = 58.02,['clothesx'] = 308.82,['clothesy'] = -224.7, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[5] =  {['label'] = "Pink Cage Motel",['no'] = "5", ['x'] = 307.57,['y'] = -213.17,['z'] = 58.02,['h'] =68.9096,['stashx'] = 306.75,['stashy'] = -208.52,['stashz'] = 58.02,['clothesx'] = 302.38,['clothesy'] = -207.23, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[6] =  {['label'] = "Pink Cage Motel",['no'] = "6", ['x'] = 311.26,['y'] = -203.56,['z'] = 58.02,['h'] =68.9096,['stashx'] = 310.6,['stashy'] = -198.73,['stashz'] = 58.02,['clothesx'] = 306.24,['clothesy'] = -197.33, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[7] =  {['label'] = "Pink Cage Motel",['no'] = "7", ['x'] = 315.71,['y'] = -194.85,['z'] = 58.02,['h'] =338.946,['stashx'] = 320.43,['stashy'] = -194.2,['stashz'] = 58.02,['clothesx'] = 321.86,['clothesy'] = -189.57, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[8] =  {['label'] = "Pink Cage Motel",['no'] = "8", ['x'] = 339.13,['y'] = -219.48,['z'] = 54.22,['h'] =248.909,['stashx'] = 339.91,['stashy'] = -224.24,['stashz'] = 54.23,['clothesx'] = 344.47,['clothesy'] = -225.5, ['clothesz'] = 54.23, ['obj'] = nil,['locked'] = true },
		[9] =  {['label'] = "Pink Cage Motel",['no'] = "9", ['x'] = 342.98,['y'] = -209.46,['z'] = 54.22,['h'] =248.909,['stashx'] = 343.68,['stashy'] = -214.29,['stashz'] = 54.23,['clothesx'] = 348.02,['clothesy'] = -215.63, ['clothesz'] = 54.23, ['obj'] = nil,['locked'] = true },
		[10] =  {['label'] = "Pink Cage Motel",['no'] = "10", ['x'] = 346.76,['y'] = -199.62,['z'] = 54.22,['h'] =248.909,['stashx'] = 347.52,['stashy'] = -204.43,['stashz'] = 54.23,['clothesx'] = 351.93,['clothesy'] = -205.76, ['clothesz'] = 54.23, ['obj'] = nil,['locked'] = true },
		[11] =  {['label'] = "Pink Cage Motel",['no'] = "11", ['x'] = 335.01,['y'] = -227.33,['z'] = 58.02,['h'] =158.946,['stashx'] = 330.25,['stashy'] = -228.11,['stashz'] = 58.02,['clothesx'] = 328.94,['clothesy'] = -232.34, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[12] =  {['label'] = "Pink Cage Motel",['no'] = "12", ['x'] = 339.06,['y'] = -219.63,['z'] = 58.02,['h'] =248.909,['stashx'] = 339.85,['stashy'] = -224.16,['stashz'] = 58.02,['clothesx'] = 344.3,['clothesy'] = -225.58, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[13] =  {['label'] = "Pink Cage Motel",['no'] = "13", ['x'] = 342.913,['y'] = -209.64,['z'] = 58.02,['h'] =248.909,['stashx'] = 343.68,['stashy'] = -214.24,['stashz'] = 58.02,['clothesx'] = 348.08,['clothesy'] = -215.59, ['clothesz'] = 58.02, ['obj'] = nil,['locked'] = true },
		[14] =  {['label'] = "Pink Cage Motel",['no'] = "14", ['x'] = 346.78,['y'] = -199.57,['z'] = 58.02,['h'] =248.909,['stashx'] = 347.46,['stashy'] = -204.4,['stashz'] = 58.02, ["clothesx"] = 351.6900, ["clothesy"] = -206.132, ["clothesz"] = 58.022, ['obj'] = nil,['locked'] = true }
	}


local round = 0
local marker = 0
local cooldown = false
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	randommotel()
end)

RegisterCommand("randomm",function()
	if cooldown == false then
		randommotel()
		cooldown = true
	else
        TriggerEvent("notification","Bunun için beklemeniz gerekiyor")
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000 * 60 * 10) 
		if cooldown then
			cooldown = false
		end
	end
end)







function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	ClearDrawOrigin()
end




local inmarker = false
function randommotel()
	Citizen.CreateThread(function()
        local wait = 1250
		round = math.random(1,#motels)
		--ESX.ShowNotification(""..motels[round]["label"].."  "..motels[round]["no"]..". oda artık sizin")
		TriggerEvent("notification",""..motels[round]["label"].."  "..motels[round]["no"]..". oda artık sizin")
		local PlayerPos = GetEntityCoords(PlayerPedId())
		while true do
			local plycoords = GetEntityCoords(PlayerPedId())
		    local dstcheck = #(plycoords - vector3(motels[round]["x"],motels[round]["y"],motels[round]["z"])) 
			if dstcheck <= Hsn.DrawDistance  then
				wait = 5
					DrawMarker(20, motels[round]["x"],motels[round]["y"],motels[round]["z"]+0.50 - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 198, 19, 78, 155, false, false, 2, false, 0, 0, 0, 0)					
				if dstcheck <= 1.0  then
					wait = 5
					if	IsControlJustReleased(0, 38) then
						kapitoggle()
					end
				end
			end
			local dstcheck2 = #(plycoords - vector3(motels[round]["stashx"],motels[round]["stashy"],motels[round]["stashz"])) 
			if dstcheck2 <= 3.0  then
				msg = 'Envanter'
				--DrawMarker(20, motels[round]["stashx"],motels[round]["stashy"],motels[round]["stashz"]+0.50 - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 16, 16, 100, 155, false, false, 2, false, 0, 0, 0, 0)
				if dstcheck2 <= 1.0  then
					-- msg = 'E - Envanter'

					wait = 5
					if	IsControlJustReleased(0, 38) then
						OpenMotelStash()
					end            
				end
				-- if not send then
				-- 	send = true
				-- end
			-- else
			-- 	if send then
			-- 		send = false
			-- 		exports["fizzfau-notification"]:Clear(msg)
			-- 	end
				DrawText3Ds(motels[round]["stashx"],motels[round]["stashy"],motels[round]["stashz"],msg)
			end
			local dstcheck3 = #(plycoords - vector3(motels[round]["clothesx"],motels[round]["clothesy"],motels[round]["clothesz"]))
			if dstcheck3 <= 3.0 then
				wait = 5
				message = 'Kıyafet Dolabı'
				if dstcheck3 <= 1.0 then
					message = 'E - '..message
					if IsControlJustReleased(0,38) then
						OpenWardrobe()
					end
				end
				-- if not send then
				-- 	send = true
				-- 	exports["fizzfau-notification"]:DrawNotify(message)
				-- end
				 DrawText3Ds(motels[round]["clothesx"],motels[round]["clothesy"],motels[round]["clothesz"],message)
			else
				-- if send then
				-- 	send = false
				-- 	exports["fizzfau-notification"]:Clear(message)
				-- end
			end
			Citizen.Wait(wait)
		end
	end)
end

OpenMotelStash = function()
	ESX.TriggerServerCallback('hsn-motels:getidentifier',function(identifier)
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "Motel"..identifier)
		TriggerEvent("inventory:client:SetCurrentStash","Motel"..identifier)
	end)
end


-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(1000)
-- 		if indist then
-- 			exports["fizzfau-ui"]:DrawNotify(id, msg)
-- 		else
-- 			exports["fizzfau-ui"]:Clear(id)
-- 		end
-- 	end
-- end)

local kapiacik = false
function kapitoggle()
	if kapiacik == false then
    RequestAnimDict("anim@heists@keycard@")
    while not HasAnimDictLoaded("anim@heists@keycard@") do
        Citizen.Wait(1)
	end
	motels[round]['locked'] = roomLocked 
	roomLocked = false
    local ped = PlayerPedId()
    TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 8.0, 8.0, 1000, 1, 1, 0, 0, 0)
    Citizen.Wait(1000)
	ClearPedTasks(ped)
	kapiacik = true
	TriggerServerEvent("hsn-motels:setdoorstate", round, roomLocked )
elseif kapiacik == true then
	RequestAnimDict("anim@heists@keycard@")
    while not HasAnimDictLoaded("anim@heists@keycard@") do
        Citizen.Wait(1)
	end
	motels[round]['locked'] = roomLocked 
	roomLocked = true
    local ped = PlayerPedId()
    TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 8.0, 8.0, 1000, 1, 1, 0, 0, 0)
    Citizen.Wait(1000)
	ClearPedTasks(ped)
	kapiacik = false
	TriggerServerEvent("hsn-motels:setdoorstate", round, roomLocked )
end
end





RegisterNetEvent("hsn-motels:setdoorstate")
AddEventHandler("hsn-motels:setdoorstate", function(round, roomLocked)
	motels[round]['locked'] = roomLocked 
end)




-- RegisterCommand("kilit",function()
-- 	local plycoords = GetEntityCoords(PlayerPedId())
-- 	local dstcheck = #(plycoords - vector3(motels[round]["x"],motels[round]["y"],motels[round]["z"])) 
-- 	if dstcheck <= 2.0  then
-- 		RequestAnimDict("anim@heists@keycard@")
-- 		while not HasAnimDictLoaded("anim@heists@keycard@") do
-- 			Citizen.Wait(1)
-- 		end
-- 		motels[round]['locked'] = roomLocked 
-- 		roomLocked = true
-- 		local ped = PlayerPedId()
-- 		TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 8.0, 8.0, 1000, 1, 1, 0, 0, 0)

-- 		TriggerServerEvent("hsn-motels:setdoorstate",round, roomLocked )
-- 	--ESX.ShowNotification("Kapı kilitlendi")
-- 	end
-- end)

function markerscheck()
    Citizen.CreateThread(function()
        while true do
            local wait = 750
            for i = 1, #motels, 1 do
                local playercoords = GetEntityCoords(PlayerPedId())
			for k,v in pairs (Hsn.MotelKo) do
				for memo,hasan in pairs (hashcode) do
                if GetDistanceBetweenCoords(playercoords, v.x,v.y, false) <= 60.0 then
					wait = 5
                        if motels[i]['obj'] == nil or not DoesEntityExist(motels[i]['obj']) then
                            motels[i]['obj'] = GetClosestObjectOfType(motels[i]['x'],motels[i]['y'],motels[i]['z'], 1.4, hasan, false, false, false)
                            FreezeEntityPosition(motels[i]['obj'], motels[i]['locked'])
						else
							cracked = true
                            FreezeEntityPosition(motels[i]['obj'], motels[i]['locked'])
                            if motels[i]['locked'] then
								SetEntityHeading(motels[i]['obj'], motels[i]['h'])
                            end
						end
					end
				end
			end
                Citizen.Wait(100)
            end
            Citizen.Wait(wait)
        end
    end)
end


OpenWardrobe = function()
	-- 	local elements = {
	-- 		{label = 'Kıyafet Sil',value = 'delete'},
	-- 		{label = 'Kıyafetini Değiştir', value = 'kiyafetdegistir'}
	-- 	}
	--   	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'value', {
	-- 		title    = "Gardrop", 
	-- 		align    = 'top-left',
	-- 		elements = elements
	--   	}, function(data, menu)
	-- 		ESX.TriggerServerCallback('hsn-motels:getplayeroutfit', function(d)
	-- 	  		local dressing = d
	-- 	  		if data.current.val == "kiyafetdegistir" then
	-- 				local elements = {}	
	-- 			  ESX.TriggerServerCallback("fizzfau-motel:getplayerdressing",function(dressing)
	-- 				for i=1, #dressing, 1 do
	-- 					table.insert(elements, {
	-- 					  label = dressing[i],
	-- 					  value = i
	-- 					})
	-- 				end
	-- 				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'change_clothes', {
	-- 					title    = "Kıyafetlerini Değiştir",
	-- 					align    = 'top-left',
	-- 					elements = elements
	-- 				  }, function(data3, menu3)
	-- 					TriggerEvent('skinchanger:getSkin', function(skin)
	-- 					  ESX.TriggerServerCallback('fizzfau-motel:getPlayerOutfit', function(clothes)
	-- 						TriggerEvent('skinchanger:loadClothes', skin, clothes)
	-- 						TriggerEvent('esx_skin:setLastSkin', skin)
			  
	-- 						TriggerEvent('skinchanger:getSkin', function(skin)
	-- 						  TriggerServerEvent('esx_skin:save', skin)
	-- 						end)
	-- 					  end, data3.current.value)
	-- 					  TriggerEvent("notification",'Kıyafetiniz değiştirildi',2)
	-- 					end)
	-- 				  end, function(data3, menu3)
	-- 					menu3.close()
	-- 				  end)
	-- 			end)
	-- 	  		elseif data.current.val == "Delete" then
	-- 				local elements = {}	
	-- 				for i=1, #dressing, 1 do
	-- 		  			table.insert(elements, {
	-- 					label = dressing[i],
	-- 					value = i
	-- 		  		})
	-- 				end	
	-- 				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
	-- 					title    = "Kıyafetlerini Sil",
	-- 					align    = 'top-left',
	-- 				   elements = elements
	-- 				  }, function(data2, menu2)
	-- 				   menu2.close()
	-- 					TriggerServerEvent('hsn-motels:removeoutfit', data2.current.value)
	-- 				  TriggerEvent("notification","Kıyafetiniz silindi")
	-- 				  end, function(data2, menu2)
	-- 					menu2.close()
	-- 				end)	
	-- 	 		end	
	-- 		end)
	--   	end, function(data8, menu8)
	-- 		menu8.close()
	-- end)
	TriggerEvent("qb-clothing:client:openOutfitMenu")	
end







