function onCreate()
    -- Настройки (можно менять)
    local settings = {
        font = "SONICEXEransomFont.ttf", -- Название файла шрифта (должен быть в папке mods/fonts/)
        timerPosition = {x = getProperty('healthBar.x') + getProperty('healthBar.width') + 20, y = getProperty('healthBar.y') - 15},
        ratingPosition = {x = getProperty('healthBar.x') - 420, y = getProperty('healthBar.y') - 15},
        textSize = 25,
        textColor = "FFFFFF",
        borderColor = "000000",
        borderSize = 1
    }

    -- Удаляем стандартный текст рейтинга снизу
    setProperty('scoreTxt.visible', false)

    -- Создаем текст для таймера справа от healthbar
    makeLuaText('timerTxt', '', 400, settings.timerPosition.x, settings.timerPosition.y)
    setTextSize('timerTxt', settings.textSize)
    setTextAlignment('timerTxt', 'left')
    setTextBorder('timerTxt', settings.borderSize, settings.borderColor)
    setTextColor('timerTxt', settings.textColor)
    setTextFont('timerTxt', settings.font)
    addLuaText('timerTxt')

    -- Создаем текст для рейтинга слева от healthbar
    makeLuaText('ratingTxt', '', 400, settings.ratingPosition.x, settings.ratingPosition.y)
    setTextSize('ratingTxt', settings.textSize)
    setTextAlignment('ratingTxt', 'right')
    setTextBorder('ratingTxt', settings.borderSize, settings.borderColor)
    setTextColor('ratingTxt', settings.textColor)
    setTextFont('ratingTxt', settings.font)
    addLuaText('ratingTxt')
end

function onUpdatePost(elapsed)
    -- Получаем оставшееся время до конца песни
    local songPos = getSongPosition()
    local totalTime = getProperty('songLength') / 1000
    local currentTime = songPos / 1000
    local timeLeft = totalTime - currentTime

    -- Форматируем время в минуты:секунды
    local minutes = math.floor(timeLeft / 60)
    local seconds = math.floor(timeLeft % 60)
    if seconds < 10 then seconds = '0' .. seconds end

    -- Обновляем текст таймера
    setTextString('timerTxt', 'Time Left: ' .. minutes .. ':' .. seconds)

    -- Обновляем текст рейтинга
    local ratingName = getProperty('ratingName')
    local ratingFC = getProperty('ratingFC')
    local ratingPercent = math.floor(getProperty('ratingPercent') * 100) / 100
    setTextString('ratingTxt', 'Rating: ' .. ratingName .. ' (' .. ratingPercent .. '%) - ' .. (ratingFC or ''))
end
