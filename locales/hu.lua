local Translations = {
    weather = {
        now_frozen = 'Az idő leállítva.',
        now_unfrozen = 'Az idő elindítva.',
        invalid_syntax = 'Rossz szintaktika, használd ezt: /weather <weathertype> ',
        invalid_syntaxc = 'Rossz szintaktika, használd ezt: /weather <weatherType> ',
        updated = 'Weather has been updated.',
        invalid = 'Helytelen időjárás típus. Használd ezeket: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        invalidc = 'Helytelen időjárás típus. Használd ezeket: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        willchangeto = 'Az időjárás megváltozott: %{value}.',
        accessdenied = 'Nincs Jogosultságod a /weather parancs használatához.',
    },
    dynamic_weather = {
        disabled = 'Dinamikus időjárás változások kikapcsolva.',
        enabled = 'Dinamikus időjárás változások kikapcsolva.',
    },
    time = {
        frozenc = 'Idő leállítva.',
        unfrozenc = 'Idő elindítva',
        now_frozen = 'Idő leállítva.',
        now_unfrozen = 'Idő elindítva',
        morning = 'Idő reggelre állítva.',
        noon = 'Idő délre állítva.',
        evening = 'Idő estére állítva.',
        night = 'Idő éjszakára állítva.',
        change = 'Az idő megváltozott: %{value}:%{value2}.',
        changec = 'Idő megváltoztatva: %{value}!',
        invalid = 'Rossz szintaktika, használd ezt: time <hour> <minute> !',
        invalidc = 'Rossz szintaktika, használd ezt: /time <hour> <minute> !',
        access = 'Nincs jogosultságod a /time parancshasználatához.',
    },
    blackout = {
        enabled = 'Áramszünet bekapcsolva.',
        enabledc = 'Áramszünet bekapcsolva.',
        disabled = 'Áramszünet kikapcsolva.',
        disabledc = 'Áramszünet kikapcsolva.',
    },
    help = {
        weathercommand = 'Időjárás megváltoztatása.',
        weathertype = 'időjárás típus.',
        availableweather = 'Időjárás típusok: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween',
        timecommand = 'Idő megváltoztatása.',
        timehname = 'óra',
        timemname = 'perc',
        timeh = 'Egy szám 0 - 23 között',
        timem = 'Egy szám 0 - 59 között',
        freezecommand = 'Idő leállít/elindít.',
        freezeweathercommand = 'Be/Kikapcsolása a Dinamikus időjárás változásoknak',
        morningcommand = 'Idő megváltoztatva: 09:00',
        nooncommand = 'Idő megváltoztatva: 12:00',
        eveningcommand = 'Idő megváltoztatva: 18:00',
        nightcommand = 'Idő megváltoztatva: 23:00',
        blackoutcommand = 'Áramszünet mód ki/be kapcsolása.',
    },
    error = {
        not_access = 'Nincs jogosultságod a parancs használatára.',
        not_allowed = 'Nincs jogosultságod a parancs használatára.',
    }
}

if GetConvar('qb_locale', 'en') == 'hu' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end
