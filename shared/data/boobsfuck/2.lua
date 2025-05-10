

function onTimerCompleted(tag)
    if tag == 'thunder_timer' then
        thunderStrike()
        runTimer('thunder_timer', math.random(6, 12)) -- снова через случайный интервал
    end
end

function thunderStrike()
    -- Эффект вспышки молнии
    makeLuaSprite('flash', '', 0, 0)
    makeGraphic('flash', screenWidth, screenHeight, 'FFFFFF')
    setScrollFactor('flash', 0, 0)
    setObjectCamera('flash', 'other')
    setProperty('flash.alpha', 0.5)
    addLuaSprite('flash', true)

    -- Быстрая затухающая вспышка
    doTweenAlpha('flashOut', 'flash', 0, 0.5, 'linear')

    -- Камера трясётся от грома
    cameraShake('camGame', 0.01, 0.3)
    cameraShake('camHUD', 0.01, 0.3)

    -- Воспроизведение звука грома (если есть thunder.ogg)
    playSound('thunder', 1)
end

function onTweenCompleted(tag)
    if tag == 'flashOut' then
        removeLuaSprite('flash', false)
    end
end
