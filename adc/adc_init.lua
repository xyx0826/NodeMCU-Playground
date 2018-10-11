-- adc_init.lua: initializes ADC reading.

adc_min = 170
adc_mid = 390
adc_max = 615

adc_tolerance = 10

adc_offset = 0

function adc_init ()
    if (file.open("FLAG_ADC_OFFSET", "r")) then
        adc_offset = file.readline()
        file.close()
        util_log("Adc", "Using ADC offset ".. adc_offset)
    end
end
