local Translations = {
    weather = {
        now_frozen = '天候変化を止めました',
        now_unfrozen = '天候変化を再開しました',
        invalid_syntax = '構文が間違っています: /weather <weathertype> ',
        invalid_syntaxc = '構文が間違っています。 /weather <weatherType> の形式で入力してください!',
        updated = '天候を更新しました',
        invalid = '天候種類の指定が間違っています。有効な種類: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        invalidc = '天候種類の指定が間違っています。有効な種類: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        willchangeto = '天候を %{value} にしました',
        accessdenied = '/weather コマンドへのアクセスを拒否されました',
    },
    dynamic_weather = {
        disabled = '動的な天候変化が無効になりました',
        enabled = '動的な天候変化が有効になりました',
    },
    time = {
        frozenc = '時刻を止めました',
        unfrozenc = '時刻を再開しました',
        now_frozen = '時刻を止めました',
        now_unfrozen = '時刻を再開しました',
        morning = '時刻を朝にします',
        noon = '時刻をお昼にします',
        evening = '時刻を夕方にします',
        night = '時刻を夜にします',
        change = '時刻を %{value}:%{value2} にしました',
        changec = '時刻を %{value} にしました!',
        invalid = '構文が間違っています! 正しい構文: time <hour> <minute>',
        invalidc = '構文が間違っています。 /time <hour> <minute> の形式で入力してください!',
        access = '/time コマンドへのアクセスを拒否されました',
    },
    blackout = {
        enabled = 'ブラックアウトが有効になりました',
        enabledc = 'ブラックアウトが有効になりました',
        disabled = 'ブラックアウトが無効になりました',
        disabledc = 'ブラックアウトが無効になりました',
    },
    help = {
        weathercommand = '天候を変えます',
        weathertype = 'weathertype',
        availableweather = '有効な種類: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween',
        timecommand = '時刻を変えます',
        timehname = 'hours',
        timemname = 'minutes',
        timeh = '0 - 23 の間で指定',
        timem = '0 - 59 の間で指定',
        freezecommand = '時刻停止状態を切り替えます',
        freezeweathercommand = '動的な天候変化有無を切り替えます',
        morningcommand = '時刻を09:00にします',
        nooncommand = '時刻を12:00にします',
        eveningcommand = '時刻を18:00にします',
        nightcommand = '時刻を23:00にします',
        blackoutcommand = 'ブラックアウトモードを切り替えます',
    },
}

if GetConvar('qb_locale', 'en') == 'ja' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
