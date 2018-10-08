-- io_button.lua: DOES NOT WORK. DO NOT USE.
button_pin = 0

function do_io_button ()
    print("Button pressed.")
end

function io_button ()
    gpio.mode(button_pin, gpio.INT, gpio.PULLUP)
    gpio.trig(button_pin, "down", do_io_button)
end
