-- led_blink_twice.lua: blinks LED twice.
-- global variables.
led_off = true
led_blinked = 0

-- Function for toggling LED state.
function do_led_blink_twice ()
    if (led_blinked >= 4) then
        led_off = true
        led_reset()
        tmr.unregister(0)
        return
    end

    if (led_off) then
        gpio.write(4, gpio.LOW)
    else
        gpio.write(4, gpio.HIGH)
    end

    led_off = not led_off
    led_blinked = led_blinked + 1
end

-- function for start blinking!
function led_blink_twice ()
    led_reset()
    -- enable GPIO and get going
    gpio.mode(4, gpio.OUTPUT)
    tmr.alarm(0, 100, tmr.ALARM_AUTO, do_led_blink_twice)
end
