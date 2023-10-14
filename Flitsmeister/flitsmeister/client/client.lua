ESX = exports["es_extended"]:getSharedObject()
FlitsmeisterON = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)


RegisterCommand("flitsmeister", function()
	if FlitsmeisterON == false then
		FlitsmeisterON = true 
		TriggerEvent("413x-notify:Alert", "success", "Flitsmeister", "Flitsmeister ingeschakeld", 3000)
		toggle = true
		TriggerEvent('flitsmeister:flitsmeisterON')	
	elseif FlitsmeisterON == true then 
		FlitsmeisterON = false 
		TriggerEvent("413x-notify:Alert", "error", "Flitsmeister", "Flitsmeister uitgeschakeld", 3000)
		toggle = false
	end
end, false)


RegisterNetEvent('flitsmeister:flitsmeisterON')
AddEventHandler('flitsmeister:flitsmeisterON', function()
	if toggle == true then 
		while toggle == true do
			local player = PlayerPedId()
			Citizen.Wait(10)
			if toggle == true then
				for i in pairs(Frz.Cameralocs) do 
					local playercoords = GetEntityCoords(player) 
					local distance = GetDistanceBetweenCoords(playercoords, Frz.Cameralocs[i], true)
					if distance < 140 then 
						local roundedDistance = math.floor(distance)
						local message = string.format("Flistpaal in %d meter", roundedDistance)
						TriggerEvent("413x-notify:Alert", "warning", "Flitsmeister", message, 3000)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'demo', 1.0)
						Citizen.Wait(12000)
					end				
				end
			end
		end
	end
end)

