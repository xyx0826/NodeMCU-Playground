-- pwm_set_angle.lua: sets angle of an initialized 485HB servo.
function pwm_set_angle (deg)
    if (deg < -90 or deg > 90)
    then
        util_log("Pwm", "Angle degree out of bounds.")
        return
    end

    local degDuty = (deg + 90) / 2 + 25
    util_log("Pwm", "Setting PWM duty to " .. degDuty)
    pwm.setduty(pwm_pin, degDuty)
    pwm.start(pwm_pin)
    tmr.start(1)
end
