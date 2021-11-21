#!/bin/bash

set -e

# check root permissions
if [ `id -u` == "0" ]; then
    echo "Please run as non root/sudo!"
    exit 1
fi

# set sublime text as default text editor
echo "Setting Sublime Text as default text editor..."
unzip -q data_files/defaults.zip -d ~/.local/share/applications/
echo -e "Done.\n"

# set favorite applications
echo "Setting favorite applications..."
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'sublime-text_subl.desktop', 'telegram-desktop_telegram-desktop.desktop', 'filezilla.desktop', 'putty.desktop']"
echo -e "Done.\n"

#add desktop shortcuts
echo "Adding desktop shortcuts..."
ln -s ~/Downloads ~/Desktop/
ln -s /usr/share/applications/org.gnome.Nautilus.desktop ~/Desktop/
ln -s /usr/share/applications/org.gnome.Software.desktop ~/Desktop/
ln -s /usr/share/applications/org.gnome.tweaks.desktop ~/Desktop/
echo -e "Done.\n"

# reboot to apply changes
echo -n "Rebooting"
for i in 1 2 3 4 5
do
	echo -n "."
	sleep 1
done
/sbin/reboot