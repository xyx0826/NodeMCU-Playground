-- wifi_ap_reset.lua: defines Soft-AP mode Wi-Fi config.
-- function for regenerating BSSID and password.
function wifi_ap_reset ()
    -- Sets random SSID and password.
    local wiCfg = {}
    wiCfg.ssid = "Alpine_" .. rndstr()
    wiCfg.pwd = rndstr()
    wifi.ap.config(wiCfg)
    print("New SSID is now ", wiCfg.ssid)
    print("New password is now ", wiCfg.pwd)

    -- Restarts Wi-Fi subsystem.
    wifi.setmode(wifi.NULLMODE)
    wifi.setmode(wifi.SOFTAP)
end

-- Utility function for a random 8-digit string.
function rndstr () 
    return tostring(node.random(10000000, 99999999))
end
