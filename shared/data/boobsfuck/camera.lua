

function onMoveCamera(focus)
	if focus == 'dad' then
	setProperty('defaultCamZoom', 0.5)
	end
	if focus == 'boyfriend' then
	setProperty('defaultCamZoom', 0.6)
	end
end


function onCreate()
	makeLuaSprite('blackScreen', '', 0, 0)
	makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
	setObjectCamera('blackScreen', 'other')
	addLuaSprite('blackScreen', true)
	setProperty('blackScreen.alpha', 1)
end

function onSongStart()
	doTweenAlpha('fadeBlack', 'blackScreen', 0, 6, 'linear')
end

function onSongStart()
	doTweenAlpha('fadeBlack', 'blackScreen', 0, 6, 'linear')

	makeLuaSprite('blackFlash', '', 0, 0)
	makeGraphic('blackFlash', 1280, 720, '000000')
	setObjectCamera('blackFlash', 'hud')
	setProperty('blackFlash.alpha', 0)
	addLuaSprite('blackFlash', true)
end



function triggerBlackFlash(duration)

	setProperty('blackFlash.alpha', 1)
	doTweenAlpha('blackFlashOut', 'blackFlash', 0, duration, 'linear')
end




