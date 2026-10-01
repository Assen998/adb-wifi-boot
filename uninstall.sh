# restore the default adbd state (USB mode)
setprop persist.adb.tcp.port ""
setprop service.adb.tcp.port ""
stop adbd
start adbd
