-- pwm_servo_init.lua: initializes control of a 485HB servo.
pwm_pin = 2
pwm_freq = 50
pwm_duty_min = 25
pwm_duty_mid = 70
pwm_duty_max = 115


tmr.alarm(1, 1000, tmr.ALARM_SEMI, 
    function()
        pwm.stop(pwm_pin)
        util_log("Pwm", "Command timed out. Servo released.")
    end)

function pwm_servo_init ()
    util_log("Pwm", "Initializing servo at pin " .. pwm_pin .. "...")
    pwm.setup(pwm_pin, pwm_freq, pwm_duty_mid)
    pwm.start(pwm_pin)
    tmr.start(1)
end
