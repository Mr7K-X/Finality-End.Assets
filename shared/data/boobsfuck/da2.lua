local pos = 625            --    notes pos
local camScale = 1.6    --    camera Scale

function onCreate()
    setProperty('camHUD.flashSprite.scaleX', camScale)
    setProperty('camHUD.flashSprite.scaleY', camScale)
end

function onCreatePost()
    --    hud pos
    if not downscroll then
        pos = -10
        setProperty('healthBar.y', 725)
        setProperty('iconP2.y', 655)
        setProperty('iconP1.y', 655)
        setProperty('scoreTxt.y', 760)
        setProperty('timeBar.y', -50)
        setProperty('timeTxt.y', -55)
    else
        setProperty('healthBar.y', -5)
        setProperty('iconP2.y', -65)
        setProperty('iconP1.y', -75)
        setProperty('scoreTxt.y', 30)
        setProperty('timeBar.y', 750)
        setProperty('timeTxt.y', 740)
    end

    --    black borders
    makeLuaSprite('borde1', nil, 0, 0)
    makeGraphic('borde1', 150, screenHeight, '000000')
    setObjectCamera('borde1', 'camOther')
    addLuaSprite('borde1', false)

    makeLuaSprite('borde2', nil, screenWidth - 150, 0)
    makeGraphic('borde2', 150, screenHeight, '000000')
    setObjectCamera('borde2', 'camOther')
    addLuaSprite('borde2', false)

    for i = 0, 7 do
        noteTweenY('note'..i, i, pos, 0.001, 'linear')
    end
end

function onUpdatePost()
    runHaxeCode("game.camHUD.setScale(game.camHUD.zoom / 2, game.camHUD.zoom / 2);")
end
