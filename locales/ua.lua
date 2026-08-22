local Translations = {
    weather = {
        now_frozen = 'Погода заморожена.',
        now_unfrozen = 'Погода більше не заморожена.',
        invalid_syntax = 'Невірний синтаксис, правильний: /weather <типпогоди> ',
        invalid_syntaxc = 'Невірний синтаксис, використай /weather <типпогоди>!',
        updated = 'Погода оновлена.',
        invalid = 'Невірний тип погоди. Доступні типи: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        invalidc = 'Невірний тип погоди. Доступні типи: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        willchangeto = 'Погода зміниться на: %{value}.',
        accessdenied = 'Доступ до команди /weather заборонено.',
    },
    dynamic_weather = {
        disabled = 'Динамічна зміна погоди вимкнена.',
        enabled = 'Динамічна зміна погоди увімкнена.',
    },
    time = {
        frozenc = 'Час заморожено.',
        unfrozenc = 'Час більше не заморожено.',
        now_frozen = 'Час заморожено.',
        now_unfrozen = 'Час більше не заморожено.',
        morning = 'Час встановлено на ранок.',
        noon = 'Час встановлено на полудень.',
        evening = 'Час встановлено на вечір.',
        night = 'Час встановлено на ніч.',
        change = 'Час змінено на %{value}:%{value2}.',
        changec = 'Час змінено на: %{value}!',
        invalid = 'Невірний синтаксис. Правильний: time <година> <хвилина> !',
        invalidc = 'Невірний синтаксис. Використай /time <година> <хвилина>!',
        access = 'Доступ до команди /time заборонено.',
    },
    blackout = {
        enabled = 'Режим блекауту увімкнено.',
        enabledc = 'Режим блекауту увімкнено.',
        disabled = 'Режим блекауту вимкнено.',
        disabledc = 'Режим блекауту вимкнено.',
    },
    help = {
        weathercommand = 'Змінити погоду.',
        weathertype = 'типпогоди',
        availableweather = 'Доступні типи: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas та halloween',
        timecommand = 'Змінити час.',
        timehname = 'години',
        timemname = 'хвилини',
        timeh = 'Число від 0 до 23',
        timem = 'Число від 0 до 59',
        freezecommand = 'Заморозити / розморозити час.',
        freezeweathercommand = 'Увімкнути/вимкнути динамічну зміну погоди.',
        morningcommand = 'Встановити час на 09:00',
        nooncommand = 'Встановити час на 12:00',
        eveningcommand = 'Встановити час на 18:00',
        nightcommand = 'Встановити час на 23:00',
        blackoutcommand = 'Увімкнути/вимкнути режим блекауту.',
    },
}

if GetConvar('qb_locale', 'en') == 'ua' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end
