io_flash_btn = 3

function do_io_btn (level, when, eventcount)
    pwm_set_angle(45)
end

function io_btn ()
    gpio.mode(io_flash_btn, gpio.INT)
    gpio.trig(io_flash_btn, "down", do_io_btn)
end
