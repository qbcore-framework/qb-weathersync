local Translations = {
    weather = {
        now_frozen = 'Orai sustabdyti.',
        now_unfrozen = 'Orai nebe sustoję.',
        invalid_syntax = 'Neteisinga sintaksė, teisinga sintaksė yra: /weather <orų tipas> ',
        invalid_syntaxc = 'Neteisinga sintaksė, naudokite /weather <orų tipas>!',
        updated = 'Orai buvo atnaujinti.',
        invalid = 'Neteisingas orų tipas, galimi orų tipai: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        invalidc = 'Neteisingas orų tipas, galimi orų tipai: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        willchangeto = 'Orai pasikeisti į: %{value}.',
        accessdenied = 'Komandos /weather prieiga neleidžiama.',
    },
    dynamic_weather = {
        disabled = 'Dinaminių orų keitimasis išjungtas.',
        enabled = 'Dinaminių orų keitimasis įjungtas.',
    },
    time = {
        frozenc = 'Laikas sustabdytas.',
        unfrozenc = 'Laikas nebe sustojęs.',
        now_frozen = 'Laikas sustabdytas.',
        now_unfrozen = 'Laikas nebe sustojęs.',
        morning = 'Nustatytas ryto laikas.',
        noon = 'Nustatytas pietų laikas.',
        evening = 'Nustatytas vakaro laikas.',
        night = 'Nustatytas nakties laikas.',
        change = 'Laikas nustatytas į %{value}:%{value2}.',
        changec = 'Laikas nustatytas į: %{value}!',
        invalid = 'Neteisinga sintaksė, teisinga sintaksė: time <valanda> <minutė>!',
        invalidc = 'Neteisinga sintaksė. Naudokite /time <valanda> <minutė>!',
        access = 'Komandos /time prieiga neleidžiama.',
    },
    blackout = {
        enabled = 'Užtemimas įjungtas.',
        enabledc = 'Užtemimas įjungtas.',
        disabled = 'Užtemimas išjungtas.',
        disabledc = 'Užtemimas išjungtas.',
    },
    help = {
        weathercommand = 'Orų nustatymas.',
        weathertype = 'orų tipas',
        availableweather = 'Galimi tipai: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas, halloween',
        timecommand = 'Laiko nustatymas.',
        timehname = 'valandos',
        timemname = 'minutės',
        timeh = 'Skaičius tarp 0 - 23',
        timem = 'Skaičius tarp 0 - 59',
        freezecommand = 'Laiko sustabdymas.',
        freezeweathercommand = 'Orų keitimosi nustatymas.',
        morningcommand = 'Laikas nustatytas į 09:00',
        nooncommand = 'Laikas nustatytas į 12:00',
        eveningcommand = 'Laikas nustatytas į 18:00',
        nightcommand = 'Laikas nustatytas į 23:00',
        blackoutcommand = 'Užtemimo nustatymas.',
    },
    error = {
        not_access = 'Jūs neturite leidimo šiai komandai.',
        not_allowed = 'Jums neleidžiama naudoti šios komandos.',
    }
}

if GetConvar('qb_locale', 'en') == 'lt' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end
