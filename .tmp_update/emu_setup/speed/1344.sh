#!/bin/sh

. /mnt/SDCARD/spruce/scripts/helperFunctions.sh

IMAGE_PATH="/mnt/SDCARD/icons/systemoptions/1344.png"
EMU_DIR="$(dirname "$0")"
CONFIG="$EMU_DIR/config.json"
SYS_OPT="$EMU_DIR/system.opt"

update_cpu_config_name() {
    if [ -f "$CONFIG" ]; then
        sed -i 's|"name": "✓ CPU is at 648 MHz"|"name": "Set CPU to 648 MHz"|g' "$CONFIG"
        sed -i 's|"name": "✓ CPU is at 816 MHz"|"name": "Set CPU to 816 MHz"|g' "$CONFIG"
        sed -i 's|"name": "✓ CPU is at 1200 MHz"|"name": "Set CPU to 1200 MHz"|g' "$CONFIG"
        sed -i 's|"name": "✓ CPU is at 1344 MHz"|"name": "Set CPU to 1344 MHz"|g' "$CONFIG"
        sed -i 's|"name": "✓ CPU is at 1512 MHz"|"name": "Set CPU to 1512 MHz"|g' "$CONFIG"
        sed -i 's|"name": "Set CPU to 1344 MHz"|"name": "✓ CPU is at 1344 MHz"|g' "$CONFIG"
    fi
}

update_cpu_config_name

sed -i 's/CPU=.*/CPU=\"1344\"/g' "$SYS_OPT"

if [ -f "$IMAGE_PATH" ]; then
    show_image "$IMAGE_PATH" 2
fi
