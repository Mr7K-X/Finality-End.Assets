local x = -700
local y = -165

function onCreate()
    createInstance('e', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, 0, 0})
    loadGraphic('e', 'bgsongs/bbsfc/bg')
    scaleObject('e', 2.8, 2.8);
    setProperty('e.velocity.x', -100)
    setProperty('e.y', -1000)


    createInstance('e1', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, 100, 100})
    loadGraphic('e1', 'bgsongs/bbsfc/cloud')
    scaleObject('e1', 2.8, 2.8);
    setProperty('e1.velocity.x', -100)
    setProperty('e1.y', -400)

    createInstance('31', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, 100, 100})
    loadGraphic('31', 'bgsongs/bbsfc/cloud')
    scaleObject('31', 2.8, 2.8);
    setProperty('31.velocity.x', -300)
    setProperty('31.y', -800)

    createInstance('312', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, 0, 0})
    loadGraphic('312', 'bgsongs/bbsfc/smoke')
    scaleObject('312', 2.8, 2.8);
    setProperty('312.velocity.x', -300)
    setProperty('312.y', -1000)





    makeLuaSprite("1","bgsongs/bbsfc/poll",x, -1000)
    setScrollFactor('1', 1, 1);
    scaleObject('1', 2.8, 2.8);




    makeLuaSprite("4","bgsongs/bbsfc/smoke",x, -1000)
    setScrollFactor('4', 1, 1);
    scaleObject('4', 2.8, 2.8);

    makeLuaSprite("2","bgsongs/bbsfc/sexshop",x, -1000)
    setScrollFactor('2', 1, 1);
    scaleObject('2', 2.8, 2.8);

    makeLuaSprite("21","bgsongs/bbsfc/shadow",x, -1000)
    setScrollFactor('21', 1, 1);
    scaleObject('21', 2.8, 2.8);

    makeLuaSprite("idk","bgsongs/bbsfc/zanaves3",x, -900)
    setScrollFactor('idk', 1, 1);
    scaleObject('idk', 2.8, 2.8);


    makeLuaSprite("idk2","bgsongs/bbsfc/zanaves2",x, -1000)
    setScrollFactor('idk2', 1, 1);
    scaleObject('idk2', 2.8, 2.8);


    makeLuaSprite("idk3","bgsongs/bbsfc/zanaves1",x, -1000)
    setScrollFactor('idk3', 1, 1);
    scaleObject('idk3', 2.8, 2.8);


    makeLuaSprite("3","bgsongs/bbsfc/lest",x, -1000)
    setScrollFactor('3', 1, 1);
    scaleObject('3', 2.8, 2.8);

    makeLuaSprite("6","bgsongs/bbsfc/par",x, -1000)
    setScrollFactor('6', 1, 1);
    scaleObject('6', 2.8, 2.8);







    addInstance('e', false)
    addInstance("31",false)
    addInstance("312",false)
    addInstance('e1', false)

    addLuaSprite("1",false)
    addLuaSprite("2",false)
    addLuaSprite("3",false)
    addLuaSprite("6",true)

    addLuaSprite("21",false)
    addLuaSprite("idk",true)
    addLuaSprite("idk2",true)
    addLuaSprite("idk3",true)


end
function onStepHit()

    if curStep == 1 then
        doTweenZoom('cameraZoomOut', 'camGame', 0.55, 6, 'quadOut')
    end
    if curStep == 64 then
        doTweenZoom('cameraZoomOut', 'camGame', 1, 0.5, 'quadOut')
    end
    if curStep == 1 then
        doTweenAlpha('21', '21', 0, 0.1, 'linear')
        doTweenAlpha('idk', 'idk', 0, 0.1, 'linear')
        doTweenAlpha('idk2', 'idk2', 0, 0.1, 'linear')
        doTweenAlpha('idk3', 'idk3', 0, 0.1, 'linear')
    end

    if curStep == 590 then
        doTweenAlpha('21', '21', 1, 0.01, 'linear')
        doTweenAlpha('idk', 'idk', 1, 0.01, 'linear')
        doTweenAlpha('idk3', 'idk3', 1, 0.01, 'linear')
    end
    if curStep == 671 then
        doTweenAlpha('idk2', 'idk2', 1, 0.01, 'linear')
    end
    if curStep == 752 then
        doTweenAlpha('21', '21', 0, 0.01, 'linear')
        doTweenAlpha('idk', 'idk', 0, 0.01, 'linear')
        doTweenAlpha('idk2', 'idk2', 0, 0.01, 'linear')
        doTweenAlpha('idk3', 'idk3', 0, 0.01, 'linear')
    end
end

function onUpdatePost(elapsed)
    setProperty('iconP1.x', getMidpointX('healthBar')+228); setProperty('iconP2.x', getMidpointX('healthBar')-372)
end
