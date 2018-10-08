-- led_reset.lua: resets LED status to off.
function led_reset ()
    tmr.stop(0)
    pwm.stop(led_pin)
    gpio.mode(led_pin, gpio.OUTPUT)
    gpio.write(led_pin, 1)
end
