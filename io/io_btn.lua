io_flash_btn = 3

function do_io_btn (level, when, eventcount)
    if (pwm_active) then
        util_log("Io", "PWM already active. Command blocked.")
        return
    end
    
    if (adc_check_max()) then
        pwm_set_angle(-90)
    else
        pwm_set_angle(90)
    end
end

function io_btn ()
    gpio.mode(io_flash_btn, gpio.INT)
    gpio.trig(io_flash_btn, "down", do_io_btn)
end
