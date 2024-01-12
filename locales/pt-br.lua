local Translations = {
    weather = {
        now_frozen = 'O clima está congelado agora.',
        now_unfrozen = 'O clima não está mais congelado.',
        invalid_syntax = 'Sintaxe inválida, a sintaxe correta é: /weather <tipo de clima> ',
        invalid_syntaxc = 'Sintaxe inválida, use /weather <tipoDeClima> em vez disso!',
        updated = 'O clima foi atualizado.',
        invalid = 'Tipo de clima inválido, os tipos de clima válidos são: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        invalidc = 'Tipo de clima inválido, os tipos de clima válidos são: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        willchangeto = 'O clima mudará para: %{value}.',
        accessdenied = 'Acesso negado para o comando /weather.',
    },
    dynamic_weather = {
        disabled = 'As mudanças dinâmicas de clima agora estão desabilitadas.',
        enabled = 'As mudanças dinâmicas de clima agora estão habilitadas.',
    },
    time = {
        frozenc = 'O tempo está congelado agora.',
        unfrozenc = 'O tempo não está mais congelado.',
        now_frozen = 'O tempo está congelado agora.',
        now_unfrozen = 'O tempo não está mais congelado.',
        morning = 'O horário foi definido para a manhã.',
        noon = 'O horário foi definido para o meio-dia.',
        evening = 'O horário foi definido para a tarde.',
        night = 'O horário foi definido para a noite.',
        change = 'O horário mudou para %{value}:%{value2}.',
        changec = 'O horário foi alterado para: %{value}!',
        invalid = 'Sintaxe inválida, a sintaxe correta é: time <hora> <minuto> !',
        invalidc = 'Sintaxe inválida. Use /time <hora> <minuto> em vez disso!',
        access = 'Acesso negado para o comando /time.',
    },
    blackout = {
        enabled = 'O modo de blecaute agora está habilitado.',
        enabledc = 'O modo de blecaute agora está habilitado.',
        disabled = 'O modo de blecaute agora está desabilitado.',
        disabledc = 'O modo de blecaute agora está desabilitado.',
    },
    help = {
        weathercommand = 'Mude o clima.',
        weathertype = 'tipoDeClima',
        availableweather = 'Tipos disponíveis: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas e halloween',
        timecommand = 'Mude o horário.',
        timehname = 'horas',
        timemname = 'minutos',
        timeh = 'Um número entre 0 - 23',
        timem = 'Um número entre 0 - 59',
        freezecommand = 'Congele / descongele o tempo.',
        freezeweathercommand = 'Ative / desative as mudanças dinâmicas de clima.',
        morningcommand = 'Defina o horário para 09:00',
        nooncommand = 'Defina o horário para 12:00',
        eveningcommand = 'Defina o horário para 18:00',
        nightcommand = 'Defina o horário para 23:00',
        blackoutcommand = 'Ative o modo de blecaute.',
    },
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
