#!/system/bin/sh
# ADB WiFi Boot: enable ADB over TCP (port 5555) at every boot.
# Runs as root by KernelSU's module system (ksud -> services stage).

MODDIR=${0%/*}

(
    # wait for boot to complete, then a little extra for the network
    until [ "$(getprop sys.boot_completed)" = "1" ]; do
        sleep 2
    done
    sleep 5

    # persist.adb.tcp.port survives reboots (adbd reads it at startup);
    # service.adb.tcp.port + adbd restart makes it effective immediately.
    setprop persist.adb.tcp.port 5555
    setprop service.adb.tcp.port 5555
    stop adbd
    start adbd
) &
