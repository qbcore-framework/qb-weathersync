QBCore.Commands.Add("blackout", "Toggle blackout", {}, false, function(source, args)
    ToggleBlackout()
end, "admin")

QBCore.Commands.Add("clock", "Set exact time", {}, false, function(source, args)
    if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
        SetExactTime(args[1], args[2])
    end
end, "admin")

QBCore.Commands.Add("time", "Set time", {}, false, function(source, args)
    for _, v in pairs(AvailableTimeTypes) do
        if args[1]:upper() == v then
            SetTime(args[1])
            return
        end
    end
end, "admin")

QBCore.Commands.Add("weather", "Set the weather", {}, false, function(source, args)
    for _, v in pairs(AvailableWeatherTypes) do
        if args[1]:upper() == v then
            SetWeather(args[1])
            return
        end
    end
end, "admin")

QBCore.Commands.Add("freeze", "freeze the time", {}, false, function(source, args)
    if args[1] ~= nil and args[1]:lower() == 'weather' or args[1]:lower() == 'time' then
        FreezeElement(args[1])
    else
        TriggerClientEvent('QBCore:Notify', source, "Icorrect syntax or missing arguments", "error")
    end
end, "admin")