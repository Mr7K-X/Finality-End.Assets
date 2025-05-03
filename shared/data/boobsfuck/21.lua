function onCreate()

    makeLuaSprite('fog', '', 0, 0)
    makeGraphic('fog', screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera('fog', 'hud')
    setProperty('fog.alpha', 0)
    addLuaSprite('fog', true)
end

function onStepHit()
    if curStep % 128 == 0 then

        doTweenAlpha('fogIn', 'fog', 0.4, 1, 'linear')

        runTimer('fogOut', 2.5)
    end
end

function onTimerCompleted(tag)
    if tag == 'fogOut' then

        doTweenAlpha('fogOutTween', 'fog', 0, 1, 'linear')
    end
end
