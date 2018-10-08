-- led_pulse.lua: pulsing LED light.
-- global variables: LED pin, PWM duty cycle etc
led_pin = 4
led_dty_max = 1010
led_dty_min = 650
led_dty_now = 1020
led_dty_stepping = 5
led_dimming = true

-- function for pulsing the LED on in/decrements of 3
function do_led_pulse ()
    local currentDuty = pwm.getduty(led_pin)
    
    if (led_dimming)
    then
        led_dty_now = led_dty_now - led_dty_stepping
        
        if (led_dty_now < led_dty_min)
        then
            led_dty_now = led_dty_min
            led_dimming = false
            return
        end

    else
        led_dty_now = led_dty_now + led_dty_stepping

        if (led_dty_now > led_dty_max)
        then
            led_dty_now = led_dty_max
            led_dimming = true
            return
        end
    end
    pwm.setduty(led_pin, led_dty_now)
end

-- function for start pulsing!
function led_pulse ()
    -- release the pin
    led_reset()
    -- initialize PWM on specified pin
    pwm.setup(led_pin, 100, led_dty_now)
    pwm.start(led_pin)
    -- start timer
    tmr.alarm(0, 10, tmr.ALARM_AUTO, do_led_pulse)
end
