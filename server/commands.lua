QBCore.Commands.Add("blackout", "Enable Blackout (Admin Only)", {}, false, function(source, args)
    ToggleBlackout()
end, "admin")

QBCore.Commands.Add("clock", "Set Exact Time (Admin Only)", {}, false, function(source, args)
    if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
        SetExactTime(args[1], args[2])
    end
end, "admin")

QBCore.Commands.Add("time", "Set Generic Time (Admin Only)", {}, false, function(source, args)
    for _, v in pairs(AvailableTimeTypes) do
        if args[1]:upper() == v then
            SetTime(args[1])
            return
        end
    end
end, "admin")

QBCore.Commands.Add("weather", "Change The Weather (Admin Only)", {}, false, function(source, args)
    for _, v in pairs(AvailableWeatherTypes) do
        if args[1]:upper() == v then
            SetWeather(args[1])
            return
        end
    end
end, "admin")

QBCore.Commands.Add("freeze", "Freeze Current Weather (Admin Only)", {}, false, function(source, args)
    if args[1]:lower() == 'weather' or args[1]:lower() == 'time' then
        FreezeElement(args[1])
    end
end, "admin")