#!/bin/sh

EMU_DIR="/mnt/SDCARD/Emu"
SETUP_DIR="$EMU_DIR/.emu_setup"
OPT_DIR="$SETUP_DIR/options"
DEF_DIR="$SETUP_DIR/defaults"
SPLORE_CART="/mnt/SDCARD/Roms/PICO8/-=☆ Launch Splore ☆=-.splore"

# copy defaults folder into options folder if needed
if [ ! -d "$OPT_DIR" ]; then
	cp -rf "$DEF_DIR" "$OPT_DIR" && log_message "copied $DEF_DIR into $OPT_DIR"
fi

# copy standard RA launch scripts to all Emu subfolders.
for dir in $EMU_DIR/* ; do
	if [ -d $dir ]; then
		cp -f "$SETUP_DIR/redirect_launch.sh" "$dir/launch.sh" && log_message "copied launch.sh to $dir"
	fi
done

# create splore launcher if it doesn't already exist
if [ ! -f "$SPLORE_CART" ]; then
	touch "$SPLORE_CART" && log_message "created $SPLORE_CART"
fi
