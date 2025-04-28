function onCreate()
    if shadersEnabled then

        initLuaShader('rain')
        initLuaShader('vhs')


        makeLuaSprite('camShaderRain')
        makeGraphic('camShaderRain', 1280, 720, '000000')
        setSpriteShader('camShaderRain', 'rain')
        setObjectCamera('camShaderRain', 'camGame')
        setProperty('camShaderRain.visible', false)
        addLuaSprite('camShaderRain', false)


        makeLuaSprite('camShaderVHS')
        makeGraphic('camShaderVHS', 1280, 720, '000000')
        setSpriteShader('camShaderVHS', 'vhs')
        setObjectCamera('camShaderVHS', 'camGame')
        setProperty('camShaderVHS.visible', false)
        addLuaSprite('camShaderVHS', false)

        runHaxeCode([[
            game.camGame.setFilters([
                new ShaderFilter(game.getLuaObject('camShaderRain').shader),
                new ShaderFilter(game.getLuaObject('camShaderVHS').shader)
            ]);
        ]])
    end
end

function onUpdate(elapsed)
    if shadersEnabled then
        setShaderFloat('camShaderRain', 'iTime', os.clock())
        setShaderFloat('camShaderRain', 'iIntensity', 0.1)
        setShaderFloat('camShaderRain', 'iTimescale', 0.7)

        setShaderFloat('camShaderVHS', 'iTime', os.clock())
    end
end

function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            game.camGame.setFilters([]);
        ]])
    end
end

makeLuaSprite('4real', 'bgsongs/bbsfc/4realSprite')
setObjectCamera('4real', 'hud')
screenCenter('4real')
addLuaSprite('4real', true)
setProperty('4real.visible', true)
