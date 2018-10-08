-- init.lua: registers every code file.
-- function for enumerating every code file and run them.
function init ()
    print("INIT: starting...")
    local list = file.list();
    for name, size in pairs(list) do
        print("INIT: registering file " 
        .. name .. " (" .. size .. ")")
        if (name ~= "init.lua") then 
            dofile(name)
        end
    end
    print("INIT: all done.")
    tmr.stop(0)
    
    print("INIT: starting LED pulse...")
    led_pulse()
end

print("Initialization in 1 second...");
init_timer = tmr.create()
tmr.register(init_timer, 1000, tmr.ALARM_SINGLE, init)
tmr.start(init_timer)
