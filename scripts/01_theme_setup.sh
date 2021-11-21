#!/bin/bash

set -e

# check root permissions
if [ `id -u` == "0" ]; then
    echo "Please run as non root/sudo!"
    exit 1
fi

# extract fonts, icons, themes, extensions
echo "Extracting all necessary files..."
unzip -q data_files/fonts.zip -d ~/.local/share/fonts/
unzip -q data_files/icons.zip -d ~/.local/share/icons/
unzip -q data_files/themes.zip -d ~/.local/share/themes/
unzip -q data_files/extensions.zip -d ~/.local/share/gnome-shell/
echo -e "Done.\n"

# import settings
echo "Importing GNOME settings..."
dconf load / < data_files/gnome.dconf
echo -e "Done.\n"

# reboot to apply changes
echo -n "Rebooting"
for i in 1 2 3 4 5
do
	echo -n "."
	sleep 1
done
/sbin/reboot