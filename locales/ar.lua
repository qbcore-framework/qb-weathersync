local Translations = {
    weather = {
        now_frozen = 'تم تجميد الطقس الآن',
        now_unfrozen = 'لم يعد الطقس متجمدا',
        invalid_syntax = '/weather <weathertype> اكتب',
        invalid_syntaxc = '/weather <weatherType>',
        updated = 'تم تحديث الطقس',
        invalid = 'يوجد \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        invalidc = 'يوجد \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        willchangeto = '%{value} سيتغير الطقس إلى',
        accessdenied = 'تم رفض الوصول للأمر',
    },
    dynamic_weather = {
        disabled = 'تم تعطيل تغييرات الطقس الديناميكية الآن',
        enabled = 'تم تمكين تغييرات الطقس الديناميكية الآن',
    },
    time = {
        frozenc = 'تم تجميد الوقت الآن',
        unfrozenc = 'الوقت لم يعد مجمدا',
        now_frozen = 'تم تجميد الوقت الآن',
        now_unfrozen = 'الوقت لم يعد مجمدا',
        morning = 'الوقت المحدد هو الصباح',
        noon = 'الوقت المحدد هو المساء',
        evening = 'الوقت المحدد للمساء',
        night = 'الوقت مضبوط على الليل',
        change = '%{value}:%{value2} لقد تغير الوقت إلى',
        changec = '%{value} تم تغيير الوقت إلى',
        invalid = '/time <hour> <minute> الامر هو',
        invalidc = '/time <hour> <minute>',
        access = 'تم رفض الوصول للأمر',
    },
    blackout = {
        enabled = 'تم تمكين التعتيم الآن',
        enabledc = 'تم تمكين التعتيم الآن',
        disabled = 'تم تعطيل التعتيم الآن',
        disabledc = 'تم تعطيل التعتيم الآن',
    },
    help = {
        weathercommand = 'تغيير الطقس',
        weathertype = 'weathertype',
        availableweather = 'extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas, halloween',
        timecommand = 'غير الوقت',
        timehname = 'الساعة',
        timemname = 'الدقائق',
        timeh = '0 - 23',
        timem = '0 - 59',
        freezecommand = 'تجميد / إلغاء التجميد الوقت',
        freezeweathercommand = 'تمكين / تعطيل تغييرات الطقس الديناميكية',
        morningcommand = '09:00 تحديد على الساعة',
        nooncommand = '12:00 تحديد على الساعة',
        eveningcommand = '18:00 تحديد على الساعة',
        nightcommand = '23:00 تحديد على الساعة',
        blackoutcommand = 'تبديل وضع التعتيم',
    },
    error = {
        not_access = 'ليس لديك حق الوصول إلى هذا الأمر',
        not_allowed = 'لا يسمح لك باستخدام هذا الأمر',
    }
}

    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
