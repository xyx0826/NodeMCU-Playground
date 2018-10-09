-- init.lua: registers every code file.
local regDelaySeconds = 1

-- some utility functions have to be defined first.
-- checks whether a string starts with a substring.
function util_starts_with(string, match)
    return string:sub(1, #match) == match
end
-- utility function for logging to console.
function util_log (source, message)
    local currentSecs = tmr.now() / 1000 / 1000
    print("(" .. currentSecs .. ")\t[" .. source .. "]\t", message)
end

-- function for enumerating every code file and run them.
function init ()
    util_log("Init", "Entering initialization...")
    local list = file.list();
    for name, size in pairs(list) do
        util_log("Init", "reading " 
        .. name .. "\t(" .. size .. ") Bytes")
        if (name ~= "init.lua") then 
            dofile(name)
        end
    end
    util_log("Init", "All scripts registered.")
    tmr.stop(0)
    
    led_pulse()
    pwm_servo_init()
end

util_log("Init", "Script initialization about to begin in " .. regDelaySeconds .. " second(s).")
init_timer = tmr.create()
tmr.register(init_timer, regDelaySeconds * 1000, tmr.ALARM_SINGLE, init)
tmr.start(init_timer)
