local CurrentWeather = Config.StartWeather
local baseTime = Config.BaseTime
local timeOffset = Config.TimeOffset
local freezeTime = Config.FreezeTime
local blackout = Config.Blackout
local newWeatherTimer = Config.NewWeatherTimer
local QBCore = exports['qb-core']:GetCoreObject()

local function isAllowedToChange(player)
    if QBCore.Functions.HasPermission(player, "admin") or IsPlayerAceAllowed(player, 'command') then
        return true
    else
        return false
    end
end

local function ShiftToMinute(minute)
    timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

local function ShiftToHour(hour)
    timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end

local function NextWeatherStage()
    if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY"  then
        local new = math.random(1,2)
        if new == 1 then
            CurrentWeather = "CLEARING"
        else
            CurrentWeather = "OVERCAST"
        end
    elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        local new = math.random(1,6)
        if new == 1 then
            if CurrentWeather == "CLEARING" then CurrentWeather = "FOGGY" else CurrentWeather = "RAIN" end
        elseif new == 2 then
            CurrentWeather = "CLOUDS"
        elseif new == 3 then
            CurrentWeather = "CLEAR"
        elseif new == 4 then
            CurrentWeather = "EXTRASUNNY"
        elseif new == 5 then
            CurrentWeather = "SMOG"
        else
            CurrentWeather = "FOGGY"
        end
    elseif CurrentWeather == "THUNDER" or CurrentWeather == "RAIN" then
        CurrentWeather = "CLEARING"
    elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then
        CurrentWeather = "CLEAR"
    end
    TriggerEvent("qb-weathersync:server:RequestStateSync")
end

RegisterNetEvent('qb-weathersync:server:RequestStateSync', function()
    TriggerClientEvent('qb-weathersync:client:SyncWeather', -1, CurrentWeather, blackout)
    TriggerClientEvent('qb-weathersync:client:SyncTime', -1, baseTime, timeOffset, freezeTime)
end)

RegisterNetEvent('qb-weathersync:server:RequestCommands', function()
    local src = source
    if isAllowedToChange(src) then
        TriggerClientEvent('qb-weathersync:client:RequestCommands', src, true)
    end
end)

RegisterNetEvent('qb-weathersync:server:setWeather', function(weather)
    local validWeatherType = false
    for i,wtype in ipairs(Config.AvailableWeatherTypes) do
        if wtype == string.upper(weather) then
            validWeatherType = true
        end
    end
    if validWeatherType then
        print(Lang:t('weather.updated'))
        CurrentWeather = string.upper(weather)
        newWeatherTimer = Config.NewWeatherTimer
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    else
        print(Lang:t('weather.invalid'))
    end
end)

RegisterNetEvent('qb-weathersync:server:setTime', function(hour, minute)
    if hour and minute then
        local argh = tonumber(hour)
        local argm = tonumber(minute)
        if argh < 24 then
            ShiftToHour(argh)
        else
            ShiftToHour(0)
        end
        if argm < 60 then
            ShiftToMinute(argm)
        else
            ShiftToMinute(0)
        end
        print(Lang:t('time.change', {value = argh, value2 = argm}))
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    else
        print(Lang:t('time.invalid'))
    end
end)

RegisterNetEvent('qb-weathersync:server:toggleBlackout', function()
    blackout = not blackout
    TriggerEvent('qb-weathersync:server:RequestStateSync')
end)

RegisterCommand('freezetime', function(source)
    if source then
        if isAllowedToChange(source) then
            freezeTime = not freezeTime
            if freezeTime then
                TriggerClientEvent('QBCore:Notify', source, Lang:t('time.frozenc'))
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t('time.unfrozenc'))
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_allowed'), 'error')
        end
    else
        freezeTime = not freezeTime
        if freezeTime then
            print(Lang:t('time.now_frozen'))
        else
            print(Lang:t('time.now_unfrozen'))
        end
    end
end)

RegisterCommand('freezeweather', function(source)
    if source ~= 0 then
        if isAllowedToChange(source) then
            Config.DynamicWeather = not Config.DynamicWeather
            if not Config.DynamicWeather then
                TriggerClientEvent('QBCore:Notify', source, Lang:t('dynamic_weather.disabled'))
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t('dynamic_weather.enabled'))
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_allowed'), 'error')
        end
    else
        Config.DynamicWeather = not Config.DynamicWeather
        if not Config.DynamicWeather then
            print(Lang:t('weather.now_frozen'))
        else
            print(Lang:t('weather.now_unfrozen'))
        end
    end
end)

RegisterCommand('weather', function(source, args)
    if source == 0 then
        local validWeatherType = false
        if args[1] == nil then
            print(Lang:t('weather.invalid_syntax'))
            return
        else
            for i,wtype in ipairs(Config.AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                print(Lang:t('weather.updated'))
                CurrentWeather = string.upper(args[1])
                newWeatherTimer = Config.NewWeatherTimer
                TriggerEvent('qb-weathersync:server:RequestStateSync')
            else
                print(Lang:t('weather.invalid'))
            end
        end
    else
        if isAllowedToChange(source) then
            local validWeatherType = false
            if args[1] == nil then
                TriggerClientEvent('QBCore:Notify', source, Lang:t('weather.invalid_syntaxc'), 'error')
            else
                for i,wtype in ipairs(Config.AvailableWeatherTypes) do
                    if wtype == string.upper(args[1]) then
                        validWeatherType = true
                    end
                end
                if validWeatherType then    
                    TriggerClientEvent('QBCore:Notify', source, Lang:t('weather.willchangeto', {value = string.lower(args[1])}))
                    CurrentWeather = string.upper(args[1])
                    newWeatherTimer = Config.NewWeatherTimer
                    TriggerEvent('qb-weathersync:server:RequestStateSync')
                else
                    TriggerClientEvent('QBCore:Notify', source, Lang:t('weather.invalidc'), 'error')
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_access'), 'error')
            print(Lang:t('weather.accessdenied'))
        end
    end
end)

RegisterCommand('blackout', function(source)
    if source == 0 then
        blackout = not blackout
        if blackout then
            print(Lang:t('blackout.enabled'))
        else
            print(Lang:t('blackout.disabled'))
        end
    else
        if isAllowedToChange(source) then
            blackout = not blackout
            if blackout then
                TriggerClientEvent('QBCore:Notify', source, Lang:t('blackout.enabledc'))
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t('blackout.disabledc'))
            end
            TriggerEvent('qb-weathersync:server:RequestStateSync')
        end
    end
end)

RegisterCommand('morning', function(source)
    if source == 0 then
        print(Lang:t('time.console'))
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(9)
        TriggerClientEvent('QBCore:Notify', source, Lang:t('time.morning'))
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    end
end)

RegisterCommand('noon', function(source)
    if source == 0 then
        print(Lang:t('time.console'))
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(12)
        TriggerClientEvent('QBCore:Notify', source, Lang:t('time.noon'))
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    end
end)

RegisterCommand('evening', function(source)
    if source == 0 then
        print(Lang:t('time.console'))
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(18)
        TriggerClientEvent('QBCore:Notify', source, Lang:t('time.evening'))
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    end
end)

RegisterCommand('night', function(source)
    if source == 0 then
        print(Lang:t('time.console'))
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(23)
        TriggerClientEvent('QBCore:Notify', source, Lang:t('time.night'))
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    end
end)

RegisterCommand('time', function(source, args)
    if source == 0 then
        if tonumber(args[1]) and tonumber(args[2]) then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            print(Lang:t('time.change', {value = argh, value2 = argm}))
            TriggerEvent('qb-weathersync:server:RequestStateSync')
        else
            print(Lang:t('time.invalid'))
        end
    elseif source ~= 0 then
        if isAllowedToChange(source) then
            if tonumber(args[1]) and tonumber(args[2]) then
                local argh = tonumber(args[1])
                local argm = tonumber(args[2])
                if argh < 24 then
                    ShiftToHour(argh)
                else
                    ShiftToHour(0)
                end
                if argm < 60 then
                    ShiftToMinute(argm)
                else
                    ShiftToMinute(0)
                end
                local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
				local minute = math.floor((baseTime+timeOffset)%60)
                if minute < 10 then
                    newtime = newtime .. "0" .. minute
                else
                    newtime = newtime .. minute
                end
                TriggerClientEvent('QBCore:Notify', source, Lang:t('time.changec', {value = newtime}))
                TriggerEvent('qb-weathersync:server:RequestStateSync')
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t('time.invalid'), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_access'), 'error')
            print(Lang:t('time.access'))
        end
    end
end)

CreateThread(function()
    local previous = 0
    while true do
        Wait(0)
        local newBaseTime = os.time(os.date("!*t"))/2 + 360         --Set the server time depending of OS time
        if (newBaseTime % 60) ~= previous then                      --Check if a new minute is passed
            previous = newBaseTime % 60                             --Only update time with plain minutes, seconds are handled in the client
            if freezeTime then
                timeOffset = timeOffset + baseTime - newBaseTime			
            end
            baseTime = newBaseTime
        end 
    end
end)

CreateThread(function()
    while true do
        Wait(2000)                                          --Change to send every minute in game sync
        TriggerClientEvent('qb-weathersync:client:SyncTime', -1, baseTime, timeOffset, freezeTime)
    end
end)

CreateThread(function()
    while true do
        Wait(300000)
        TriggerClientEvent('qb-weathersync:client:SyncWeather', -1, CurrentWeather, blackout)
    end
end)

CreateThread(function()
    while true do
        newWeatherTimer = newWeatherTimer - 1
        Wait((1000 * 60) * Config.NewWeatherTimer)
        if newWeatherTimer == 0 then
            if Config.DynamicWeather then
                NextWeatherStage()
            end
            newWeatherTimer = Config.NewWeatherTimer
        end
    end
end)
