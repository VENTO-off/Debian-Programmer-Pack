#!/bin/bash

set -e

# check root permissions
if [ `id -u` != "0" ]; then
    echo "Please run as root/sudo!"
    exit 1
fi

# install snap store
echo "Installing Snap Store..."
apt-get -qq -y install snapd
snap install core
echo -e "Done.\n"

# install flameshot
echo "Installing Flameshot..."
unzip -q data_files/flameshot.zip -d /home/$(logname)/.config/flameshot/
apt-get -qq -y install flameshot
mkdir -p /home/$(logname)/.config/autostart/
cp /usr/share/applications/org.flameshot.Flameshot.desktop /home/$(logname)/.config/autostart/Flameshot.desktop
chown $(logname) /home/$(logname)/.config/autostart/Flameshot.desktop
chmod +x /home/$(logname)/.config/autostart/Flameshot.desktop
echo -e "Done.\n"

# install google chrome
echo "Installing Google Chrome..."
apt-get -qq -y install fonts-liberation
wget --show-progress -q "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
echo -e "Done.\n"

# install telegram desktop
echo "Installing Telegram Desktop..."
snap install telegram-desktop
cp /var/lib/snapd/desktop/applications/telegram-desktop_telegram-desktop.desktop /home/$(logname)/.config/autostart/telegram-desktop.desktop
sed 's/-- %u/-startintray -- %u/g' /home/$(logname)/.config/autostart/telegram-desktop.desktop | sudo tee /home/$(logname)/.config/autostart/telegram-desktop.desktop
chown $(logname) /home/$(logname)/.config/autostart/telegram-desktop.desktop
chmod +x /home/$(logname)/.config/autostart/telegram-desktop.desktop
echo -e "Done.\n"

# install sublime text
echo "Installing Sublime Text..."
snap install sublime-text --classic
echo -e "Done.\n"

# install filezilla
echo "Installing FileZilla..."
apt-get -qq -y install filezilla
echo -e "Done.\n"

# install putty
echo "Installing Putty..."
apt-get -qq -y install putty
echo -e "Done.\n"

# install git
echo "Installing Git..."
apt-get -qq -y install git
echo -e "Done."