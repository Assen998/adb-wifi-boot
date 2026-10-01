SKIPUNZIP=0

ui_print "- ADB WiFi Boot module"
ui_print "- ADB over WiFi (TCP 5555) starts on every boot"
ui_print "- Connect from PC: adb connect <phone-ip>:5555"
ui_print "- NOTE: classic TCP adb has no auth; home LAN use only"

set_perm_recursive $MODPATH 0 0 0755 0755
set_perm $MODPATH/service.sh 0 0 0755
