function onCreate()
    if shadersEnabled then
        initLuaShader('vhs')
        initLuaShader('rain')
        makeLuaSprite('camShaderVHS_game')
        makeGraphic('camShaderVHS_game', 1280, 720, '000000')
        setSpriteShader('camShaderVHS_game', 'vhs')
        setObjectCamera('camShaderVHS_game', 'other')
        setProperty('camShaderVHS_game.visible', false)
        addLuaSprite('camShaderVHS_game')

        makeLuaSprite('camShaderVHS_hud')
        makeGraphic('camShaderVHS_hud', 1280, 720, '000000')
        setSpriteShader('camShaderVHS_hud', 'vhs')
        setObjectCamera('camShaderVHS_hud', 'hud')
        setProperty('camShaderVHS_hud.visible', false)
        addLuaSprite('camShaderVHS_hud')


        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject('camShaderVHS_game').shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject('camShaderVHS_hud').shader)]);
        ]])
        makeLuaSprite('rainOverlay')
        makeGraphic('rainOverlay', 1280, 720, '00000000')
        setSpriteShader('rainOverlay', 'rain')
        setObjectCamera('rainOverlay', 'other')
        setProperty('rainOverlay.alpha', 1)
        addLuaSprite('rainOverlay', true)
        setShaderFloat('rainOverlay', 'iIntensity', 0.1)
        setShaderFloat('rainOverlay', 'iTimescale', 0.7)
    end
    makeLuaSprite('4real', 'bgsongs/bbsfc/4realSprite')
    setObjectCamera('4real', 'other')
    screenCenter('4real')
    addLuaSprite('4real', true)
    setProperty('4real.visible', true)

    makeLuaSprite('4real1', 'bgsongs/bbsfc/4realSprite2')
    setObjectCamera('4real1', 'other')
    screenCenter('4real1')
    addLuaSprite('4real1', true)

end
function onUpdate(elapsed)
    if shadersEnabled then
        local currentTime = os.clock()
        setShaderFloat('camShaderVHS_game', 'iTime', currentTime)
        setShaderFloat('camShaderVHS_hud', 'iTime', currentTime)
        setShaderFloat('rainOverlay', 'iTime', currentTime)
    end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            game.camGame.setFilters([]);
            game.camHUD.setFilters([]);
        ]])
    end
end

function onStepHit()
    if curStep == 1 then

        doTweenAlpha('4real1', '4real1', 0, 0.1, 'linear')

    end
     if curStep == 1243 then

        doTweenAlpha('4real1', '4real1', 1, 1, 'linear')

    end
end
