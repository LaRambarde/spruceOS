. /mnt/SDCARD/.tmp_update/scripts/globalFunctions.sh

echo heartbeat > /sys/devices/platform/sunxi-led/leds/led1/trigger
log_message "Set LED1 trigger to heartbeat"

alsactl store
log_message "Saved current sound settings"

log_message "Killing processes"
killall -9 main
killall -9 runtime.sh
killall -9 principal.sh
killall -9 MainUI

touch /mnt/SDCARD/.tmp_update/flags/.save_active
log_message "Created .save_active flag"

vibrate
show_image "/mnt/SDCARD/.tmp_update/res/save.png" 3

sync
log_message "Synced file systems"


log_message "Shutting down"
sleep 3
poweroff