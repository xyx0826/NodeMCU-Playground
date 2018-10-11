-- adc_checks.lua: checks servo angle by reading ADC.

function adc_check_min ()
    local adcValue = adc.read(0)
    return (math.abs(adcValue - adc_min - adc_offset)
            < adc_tolerance)
end

function adc_check_mid ()
    local adcValue = adc.read(0)
    return (math.abs(adcValue - adc_mid - adc_offset)
            < adc_tolerance)
end

function adc_check_max ()
    local adcValue = adc.read(0)
    return (math.abs(adcValue - adc_max - adc_offset)
            < adc_tolerance)
end
