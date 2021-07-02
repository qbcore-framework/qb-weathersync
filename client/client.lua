CurrentWeather = Config.StartWeather
local lastWeather = CurrentWeather
local baseTime = Config.BaseTime
local timeOffset = Config.TimeOffset
local timer = 0
local freezeTime = Config.FreezeTime
local blackout = Config.Blackout
local disable = Config.Disabled

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    disable = false
    TriggerServerEvent('qb-weathersync:server:RequestStateSync')
    TriggerServerEvent('qb-weathersync:server:RequestCommands')
end)

RegisterNetEvent('qb-weathersync:client:EnableSync')
AddEventHandler('qb-weathersync:client:EnableSync', function()
    disable = false
    TriggerServerEvent('qb-weathersync:server:RequestStateSync')
end)

RegisterNetEvent('qb-weathersync:client:DisableSync')
AddEventHandler('qb-weathersync:client:DisableSync', function()
	disable = true

	Citizen.CreateThread(function() 
		while disable do
			SetRainFxIntensity(0.0)
			SetWeatherTypePersist('EXTRASUNNY')
			SetWeatherTypeNow('EXTRASUNNY')
			SetWeatherTypeNowPersist('EXTRASUNNY')
			NetworkOverrideClockTime(23, 0, 0)
			Citizen.Wait(5000)
		end
	end)
end)

RegisterNetEvent('qb-weathersync:client:SyncWeather')
AddEventHandler('qb-weathersync:client:SyncWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

RegisterNetEvent('qb-weathersync:client:RequestCommands')
AddEventHandler('qb-weathersync:client:RequestCommands', function(isAllowed)
    if isAllowed then
        TriggerEvent('chat:addSuggestion', '/freezetime', _U('help_freezecommand'), {})
        TriggerEvent('chat:addSuggestion', '/freezeweather', _U('help_freezeweathercommand'), {})
        TriggerEvent('chat:addSuggestion', '/weather', _U('help_weathercommand'), {
            { name=_U('help_weathertype'), help=_U('help_availableweather') }
        })
        TriggerEvent('chat:addSuggestion', '/blackout', _U('help_blackoutcommand'), {})
        TriggerEvent('chat:addSuggestion', '/morning', _U('help_morningcommand'), {})
        TriggerEvent('chat:addSuggestion', '/noon', _U('help_nooncommand'), {})
        TriggerEvent('chat:addSuggestion', '/evening', _U('help_eveningcommand'), {})
        TriggerEvent('chat:addSuggestion', '/night', _U('help_nightcommand'), {})
        TriggerEvent('chat:addSuggestion', '/time', _U('help_timecommand'), {
            { name=_U('help_timehname'), help=_U('help_timeh') }, 
            { name=_U('help_timemname'), help=_U('help_timem') }
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        if not disable then
            if lastWeather ~= CurrentWeather then
                lastWeather = CurrentWeather
                SetWeatherTypeOverTime(CurrentWeather, 15.0)
                Citizen.Wait(15000)
            end
            Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
            SetBlackout(blackout)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist(lastWeather)
            SetWeatherTypeNow(lastWeather)
            SetWeatherTypeNowPersist(lastWeather)
            if lastWeather == 'XMAS' then
                SetForceVehicleTrails(true)
                SetForcePedFootstepsTracks(true)
            else
                SetForceVehicleTrails(false)
                SetForcePedFootstepsTracks(false)
            end
            if lastWeather == 'RAIN' then
                SetRainLevel(0.3)
            elseif lastWeather == 'THUNDER' then
                SetRainLevel(0.5)
            else
                SetRainLevel(0.0)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

RegisterNetEvent('qb-weathersync:client:SyncTime')
AddEventHandler('qb-weathersync:client:SyncTime', function(base, offset, freeze)
    freezeTime = freeze
    timeOffset = offset
    baseTime = base
end)

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
    while true do
        if not disable then
            Citizen.Wait(0)
            local newBaseTime = baseTime
            if GetGameTimer() - 500  > timer then
                newBaseTime = newBaseTime + 0.25
                timer = GetGameTimer()
            end
            if freezeTime then
                timeOffset = timeOffset + baseTime - newBaseTime			
            end
            baseTime = newBaseTime
            hour = math.floor(((baseTime+timeOffset)/60)%24)
            minute = math.floor((baseTime+timeOffset)%60)
            NetworkOverrideClockTime(hour, minute, 0)
        else
            Citizen.Wait(1000)
        end
    end
end)
