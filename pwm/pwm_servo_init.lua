-- pwm_servo_init.lua: initializes control of a 485HB servo.
pwm_pin = 2
pwm_freq = 50

pwm_duty_min = 25
pwm_duty_mid = 70
pwm_duty_max = 115

pwm_duty_timeout = 1500

-- for servo #2 compatibility
pwm_duty_offset = 0

-- block duplicate commands
pwm_active = false

tmr.alarm(1, pwm_duty_timeout, tmr.ALARM_SEMI, 
    function()
        pwm.stop(pwm_pin)
        pwm_active = false
        util_log("Pwm", "Command timed out. Servo released.")
    end)

function pwm_servo_init ()
    util_log("Pwm", "Initializing servo at pin " .. pwm_pin .. "...")
    -- check for duty offset flag (alternative servo compat)
    if (file.open("FLAG_DUTY_OFFSET", "r")) then
        pwm_duty_offset = file.readline()
        file.close()
        util_log("Pwm", "Using PWM duty offset ".. pwm_duty_offset)
    end
    
    pwm.setup(pwm_pin, pwm_freq, pwm_duty_mid + pwm_duty_offset)
    pwm.start(pwm_pin)
    tmr.start(1)
end
