function onCreate()

    makeLuaSprite('stormOverlay', '', 0, 0)
    makeGraphic('stormOverlay', screenWidth, screenHeight, '000000')
    setObjectCamera('stormOverlay', 'camHUD')
    setProperty('stormOverlay.alpha', 0.25)
    addLuaSprite('stormOverlay', true)


    runTimer('lightningStrike', math.random(5, 10))
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lightningStrike' then
        triggerLightning()
        runTimer('lightningStrike', math.random(5, 10))
    end
end

function triggerLightning()

    cameraFlash('game', 'FFFFFF', 0.2, true)


    cameraShake('game', 0.01, 0.3)


    playSound('thunder', 0.7)


    setProperty('stormOverlay.alpha', 0.4)
    runTimer('stormFade', 0.3)
end

function onBeatHit()

    if curBeat % 2 == 0 then
        setProperty('stormOverlay.alpha', 0.25)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lightningStrike' then
        triggerLightning()
        runTimer('lightningStrike', math.random(6, 12))
    elseif tag == 'stormFade' then
        setProperty('stormOverlay.alpha', 0.25)
    end
end
