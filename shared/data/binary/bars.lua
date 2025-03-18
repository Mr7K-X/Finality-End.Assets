local ffi = require("ffi")

ffi.cdef[[
    void* FindWindowA(const char* lpClassName, const char* lpWindowName);
    int ShowWindow(void* hWnd, int nCmdShow);
]]

local SW_HIDE = 0
local SW_SHOW = 5

local function setTaskbarVisible(visible)
    local hwnd = ffi.C.FindWindowA("Shell_TrayWnd", nil)
    if hwnd ~= nil then
        ffi.C.ShowWindow(hwnd, visible and SW_SHOW or SW_HIDE)
    end
end

function onStepHit()
    if curStep == 560 then

    setTaskbarVisible(false)

    end
end

    function onCreate()

        setTaskbarVisible(true)
        end


function onEndSong()
  setTaskbarVisible(true)
    return Function_Continue;
end

function onGameOver()
    setTaskbarVisible(true)
      return Function_Continue;
  end
