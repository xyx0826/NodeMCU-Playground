-- file_get_stats.lua: print basic file system information.
-- function for printing basic file system information.
function file_get_stats ()
    print("==== Flash info ====")
    local addr, size = file.fscfg()
    print("Flash address:\t0x" .. string.format("%x", addr))
    print("File system size:\t" .. size / 1000 .. " kb")
    
    print("==== File List ====")
    local list = file.list();
    for name, size in pairs(list) do
      print(name .. ":\t" .. size .. " B")
    end

    print("==== Filesystem ====")
    local remaining, used, total = file.fsinfo()
    print("Used:\t" .. used / 1000 .. " kb")
    print("Remaining:\t".. remaining / 1000 .. " kb")
    print("Total:\t".. total / 1000 .. " kb")
end
