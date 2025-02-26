local ratingTextY = 0
local comboNum = 0
local missingRn = false
local noteX = 0
local ratingTextX = 0
function onCreate()
    setProperty('showRating', false)
    setProperty('showComboNum', false)
    setProperty('showCombo', false)

    if downscroll then
        ratingTextY = 440
    else
        ratingTextY = 200
    end
end

function onCreatePost()
    if not botPlay then

        makeLuaText('ratingText', '', 200, 850, ratingTextY)
        setTextAlignment('ratingText', 'center')
        setObjectCamera('ratingText', 'camHUD')
        setTextSize('ratingText', 37)
        addLuaText('ratingText')

        setProperty('ratingText.alpha', 0)


        makeLuaText('comboTextThing', 'ph', 200, 850, ratingTextY+45)
        setTextAlignment('comboTextThing', 'center')
        setObjectCamera('comboTextThing', 'camHUD')
        setTextSize('comboTextThing', 37)
        addLuaText('comboTextThing')

        setProperty('comboTextThing.alpha', 0)
    end

end


function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if missingRn then
        comboNum = 0
    end
    missingRn = false
    setTextColor('comboTextThing', 'FFFFFF')
    setProperty('ratingText.alpha', 1)
    setProperty('comboTextThing.alpha', 1)
    setTextAlignment('ratingText', 'center')
    cancelTween('ratingTextYdown')
    cancelTween('ratingTextBye')
    cancelTween('comboTextBye')
    cancelTween('comboTextYdown')
    if not isSustainNote then
        if getPropertyFromGroup('notes', membersIndex, 'rating') == 'sick' then
            setTextString('ratingText', 'SICK!!')
            setTextColor('ratingText', 'EE4B2B')
        elseif getPropertyFromGroup('notes', membersIndex, 'rating') == 'good' then
            setTextString('ratingText', 'GOOD!')
            setTextColor('ratingText', '90EE90')
        elseif getPropertyFromGroup('notes', membersIndex, 'rating') == 'bad' then
            setTextString('ratingText', 'BAD')
            setTextColor('ratingText', '0000FF')
        elseif getPropertyFromGroup('notes', membersIndex, 'rating') == 'shit' then
            setTextString('ratingText', 'shit!')
            setTextColor('ratingText', 'C4A484')
        end
        comboNum = comboNum + 1
        setProperty('ratingText.y', ratingTextY - 10)

        setProperty('comboTextThing.y', (ratingTextY+45) - 10)
    end
    setTextString('comboTextThing', 'x'..tostring(comboNum))
    doTweenY('ratingTextYdown', 'ratingText', ratingTextY+100, 0.6, 'sineIn')
    doTweenY('comboTextYdown', 'comboTextThing', (ratingTextY+45)+100, 0.6, 'sineIn')

    RandomAngle1 = getRandomInt(-10, 10)
    RandomAngle2 = getRandomInt(-10, 10)
    if not isSustainNote then
        setProperty('ratingText.angle', RandomAngle1)
        setProperty('comboTextThing.angle', RandomAngle2)
    end
    doTweenAlpha('ratingTextBye', 'ratingText', 0, 0.3, 'Linear')
    doTweenAlpha('comboTextBye', 'comboTextThing', 0, 0.3, 'Linear')
    if RandomAngle1 < 0 then
        doTweenAngle('ratingTextAngleFurther', 'ratingText', getProperty('ratingText.angle')-15, 0.4, 'sineIn')
    else
        doTweenAngle('ratingTextAngleFurther', 'ratingText', getProperty('ratingText.angle')+15, 0.4, 'sineIn')
    end

    if RandomAngle2 < 0 then
        doTweenAngle('comboTextAngleFurther', 'comboTextThing', getProperty('comboTextThing.angle')-15, 0.4, 'sineIn')
    else
        doTweenAngle('comboTextAngleFurther', 'comboTextThing', getProperty('comboTextThing.angle')+15, 0.4, 'sineIn')
    end

    if not isSustainNote then
        setProperty('comboTextThing.scale.x', 1.42)
        setProperty('comboTextThing.scale.y', 1.42)
        setProperty('ratingText.scale.x', 1.42)
        setProperty('ratingText.scale.y', 1.42)

        doTweenX('comboTextThing.scale.xback', 'comboTextThing.scale', 1, 0.2, 'quartOut')
        doTweenY('comboTextThing.scale.yback', 'comboTextThing.scale', 1, 0.2, 'quartOut')

        doTweenX('ratingText.scale.xback', 'ratingText.scale', 1, 0.2, 'quartOut')
        doTweenY('ratingText.scale.yback', 'ratingText.scale', 1, 0.2, 'quartOut')
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    cancelTween('comboTextBye')
    cancelTween('comboTextYdown')
    setProperty('comboTextThing.alpha', 1)
    missingRn = true
    if comboNum > 0 then
        comboNum = 0
    end
    comboNum = comboNum - 1
    setTextString('comboTextThing', 'x' .. tostring(comboNum))
    setTextColor('comboTextThing', '8B0000')
    setProperty('comboTextThing.y', (ratingTextY+45) - 10)
    doTweenY('comboTextYdown', 'comboTextThing', (ratingTextY+45), 0.3, 'quartOut')
    doTweenAlpha('comboTextBye', 'comboTextThing', 0, 0.45, 'Linear')
end



function onUpdate()
    ratingTextX = (getPropertyFromGroup('playerStrums', 0, 'x') + getPropertyFromGroup('playerStrums', 1, 'x') + getPropertyFromGroup('playerStrums', 2, 'x') + getPropertyFromGroup('playerStrums', 3, 'x')) / 4 - 45
    setProperty('ratingText.x', ratingTextX)
    setProperty('comboTextThing.x', ratingTextX)
end

setTextFont('ratingText', 'Blackcraft.ttf')
setTextFont('comboTextThing', 'Blackcraft.ttf')
