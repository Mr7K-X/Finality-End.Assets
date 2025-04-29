-- VS IMPOSTOR: Judgement Style LUA Recreation | SMixell

local judgementList = {
    sick = 'SICK!!',
    good = 'GOOD',
    bad = 'BAD',
    shit = 'SHIT'
}
local aa = getPropertyFromClass('backend.ClientPrefs', 'data.antialiasing')

setProperty('showComboNum', false)
setProperty('showRating', false)

local grpCombo = {}
function popUpScore(index)
    local separatedScore = {}
    for i, obj in pairs(grpCombo) do
        removeLuaText(obj)
        grpCombo = {}
    end
    if combo >= 1000 then table.insert(separatedScore, math.floor(combo / 1000) % 10) end -- [1,0,0,0]
    table.insert(separatedScore, math.floor(combo / 100) % 10) -- [1,0,0]
    table.insert(separatedScore, math.floor(combo / 10) % 10) -- [0,1,0]
    table.insert(separatedScore, combo % 10) -- [0,0,1]

    local judgement = getPropertyFromGroup('notes', index, 'rating')
    makeLuaText('ratingText', '4real', screenWidth, 0, 0)
    setTextString('ratingText', judgementList[judgement])
    setTextSize('ratingText', 45)
    setProperty('ratingText.y', getPropertyFromGroup('strumLineNotes', 1, 'y') + getPropertyFromGroup('strumLineNotes', 1, 'height')/2 - getProperty('ratingText.height')/1.5)
    table.insert(grpCombo, 'ratingText')
    scaleObject('ratingText', 0.95, 0.95, false)
    startTween('ratingGrow', 'ratingText.scale', {x = 1.1, y = 1.1}, 0.3, {ease = 'quadout'})

    makeLuaText('comboTxt', separatedScore[1]..separatedScore[2]..separatedScore[3], screenWidth, 0, 0)
    setTextSize('comboTxt', 35)
    setProperty('comboTxt.y', getProperty('ratingText.y') + getProperty('ratingText.height'))
    table.insert(grpCombo, 'comboTxt')
    startTween('comboTxtGrow', 'comboTxt.scale', {x = 0.95, y = 0.95}, 0.3, {ease = 'quadout'})

    for i, v in pairs(grpCombo) do
        setTextFont(v, 'HelpMe.ttf')
        setProperty(v..'.antialiasing', aa)
        setObjectCamera(v, 'hud')
        addLuaText(v)
    end

    cancelTimer('Timer')
    runTimer('Timer', 0.8)

    function popUpScoreFailed()
        for i, v in pairs(grpCombo) do
            cancelTimer('Timer')
            setProperty(v..'.color', getColorFromHex('ff0000'))
            doTweenAlpha(v.."Fail", v, 0, 0.2 / playbackRate, "linear")
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'Timer' then
        for i, v in pairs(grpCombo) do
            doTweenAlpha(v.."Nice", v, 0, 0.6 - (0.2 * i) / playbackRate)
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustain)
    if not isSustain then
        popUpScore(index)
    end
end

function noteMiss()
    popUpScoreFailed()
end

function noteMissPress()
    popUpScoreFailed()
end
