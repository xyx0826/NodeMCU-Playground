-- wifi_ap_events.lua: registers Soft-AP mode handlers for client connect/disconnect.
-- function for registering Soft-AP mode event handlers.
function wifi_ap_events ()
    -- Event handler on client connect.
    wifi.eventmon.register(
        wifi.eventmon.AP_STACONNECTED, 
        function(T)
            print(
                string.format("Client connecting: %s", T.MAC)
            )
        end
    )

    -- Event handler on client disconnect.
    wifi.eventmon.register(
        wifi.eventmon.AP_STADISCONNECTED, 
        function(T)
            print(
                string.format("Client disconnecting: %s", T.MAC)
            )
        end
    )
end
