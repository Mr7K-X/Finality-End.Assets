
local enabled = true
local bfEnabled = false

local windowShakeOnMiss = true

local fixed = false
local windowCenterOnExit = true

local offset = 20
local bfOffset = 20

local opntDuration = 1
local bfDuration = 1

local opntEase = 'circOut'
local bfEase = 'circOut'



function onCreatePost()
    addHaxeLibrary('Lib', 'openfl')
    shakin = false
    desktopX = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
    desktopY = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
    if fixed then
        winY = getPropertyFromClass('openfl.Lib', 'application.window.y')
        winX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    end
end

function onUpdate(elapsed)
    if shakin then
        cancelTweenWindow('windowShake')
        setPropertyFromClass('openfl.Lib', 'application.window.y', winY + getRandomInt(1, 5))
        setPropertyFromClass('openfl.Lib', 'application.window.x', winX + getRandomInt(1, 5))
    end
end





function doTweenWindow(tag, direction, value, duration, ease)
    runHaxeCode(tag..' = FlxTween.tween(Lib.application.window, {'..direction..': '..value..'}, '..duration..', {ease: FlxEase.'..ease..'})')
end

function cancelTweenWindow(tag)
    runHaxeCode(tag..'.cancel()')
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'wait' then
        shakin = false
    end
end

function onDestroy()
    if enabled then
        if windowCenterOnExit then
            runHaxeCode('FlxTween.tween(Lib.application.window, {y: (Lib.application.window.display.bounds.height/2)-(Lib.application.window.height/2), x: (Lib.application.window.display.bounds.width/2)-(Lib.application.window.width/2)}, 1, {ease: FlxEase.'..opntEase..'})') -- math is hard :/
        end
    end
end
