function onCreate()

    local settings = {
        font = "Blackcraft.ttf",
        timerPosition = {x = getProperty('healthBar.x') + getProperty('healthBar.width') + 20, y = getProperty('healthBar.y') - 15},
        ratingPosition = {x = getProperty('healthBar.x') - 420, y = getProperty('healthBar.y') - 15},
        textSize = 35,
        textColor = "FFFFFF",
        borderColor = "000000",
        borderSize = 1
    }


    setProperty('scoreTxt.visible', false)


    makeLuaText('timerTxt', '', 400, settings.timerPosition.x, settings.timerPosition.y)
    setTextSize('timerTxt', settings.textSize)
    setTextAlignment('timerTxt', 'left')
    setTextBorder('timerTxt', settings.borderSize, settings.borderColor)
    setTextColor('timerTxt', settings.textColor)
    setTextFont('timerTxt', settings.font)
    addLuaText('timerTxt')

    makeLuaText('ratingTxt', '', 400, settings.ratingPosition.x, settings.ratingPosition.y)
    setTextSize('ratingTxt', settings.textSize)
    setTextAlignment('ratingTxt', 'right')
    setTextBorder('ratingTxt', settings.borderSize, settings.borderColor)
    setTextColor('ratingTxt', settings.textColor)
    setTextFont('ratingTxt', settings.font)
    addLuaText('ratingTxt')
end

function onUpdatePost(elapsed)

    local songPos = getSongPosition()
    local totalTime = getProperty('songLength') / 1000
    local currentTime = songPos / 1000
    local timeLeft = totalTime - currentTime


    local minutes = math.floor(timeLeft / 60)
    local seconds = math.floor(timeLeft % 60)
    if seconds < 10 then seconds = '0' .. seconds end


    setTextString('timerTxt', 'Time Left: ' .. minutes .. ':' .. seconds)

    local ratingName = getProperty('ratingName')
    local ratingFC = getProperty('ratingFC')
    local ratingPercent = math.floor(getProperty('ratingPercent') * 100) / 100
    setTextString('ratingTxt', '' .. ratingName .. ' (' .. ratingPercent .. '%) ' .. (ratingFC or ''))
end
