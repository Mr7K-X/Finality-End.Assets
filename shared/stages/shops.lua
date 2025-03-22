local x = -700
local y = -165

function onCreate()
    makeLuaSprite("e","bgsongs/bbsfc/shop",x,-900)
    setScrollFactor('e', 1, 1);
    scaleObject('e', 2.8, 2.8);

    addLuaSprite("e",false)
end
