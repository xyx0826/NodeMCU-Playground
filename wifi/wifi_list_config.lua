-- wifi_ap_list_config.lua: prints current Wi-Fi configuration.
-- function for listing all Wi-Fi config.
function wifi_list_config ()
    print("Current Soft-AP configuration:")
    for cfgKey, cfgVal in pairs(wifi.ap.getconfig(true)) -- true for return_table
    do
        print("  " .. cfgKey .. " : ", cfgVal)
    end
end
