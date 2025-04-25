function onCreate()
    if shadersEnabled then
        initLuaShader('rain')
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', 1280, 720)
        setSpriteShader('camShader', 'rain')
        setObjectCamera('camShader', 'camGame')
        addLuaSprite('camShader', true)
        setProperty('camShader.alpha', 0)

        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
        ]])
    end
end

function onUpdate(elapsed)
    if shadersEnabled then
        setShaderFloat('camShader', 'iTime', os.clock())
        setShaderFloat('camShader', 'iIntensity', 0.1)
        setShaderFloat('camShader', 'iTimescale', 0.7)
    end
end

function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            game.camGame.setFilters([]);
        ]])
    end
end