function onCreate()
  precacheImage("NMI")
  precacheImage("jumpscare")
end
  function onStepHit()
    if curStep == 836 then
      makeAnimatedLuaSprite("nmi_jump", 'NMI')
      addAnimationByPrefix("nmi_jump", "jump", "NMI jumpscare", 24, false)
      setObjectCamera("nmi_jump", 'hud')
      addLuaSprite("nmi_jump", false)

      playAnim("nmi_jump", "jump", true)
  end

  if curStep == 622 then
      makeAnimatedLuaSprite("jumpscare", 'jumpscare')
      addAnimationByPrefix("jumpscare", "jump", "jumpscare jumping nmi vurado", 24, false)
      setObjectCamera("jumpscare", 'hud')
      addLuaSprite("jumpscare", false)

      playAnim("jumpscare", "jump", true)
  end
end
function onUpdatePost(elapsed)
  if keyboardJustPressed("SPACE") then
      jumpscare(1)
  end
  if keyboardJustPressed("ALT") then
      jumpscare(2)
  end

  if getProperty('nmi_jump.animation.curAnim.finished') then
      removeLuaSprite("nmi_jump", false)
  end
  if getProperty('jumpscare.animation.curAnim.finished') then
      removeLuaSprite("jumpscare", false)
  end
end
