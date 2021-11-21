#!/bin/bash

set -e

# check root permissions
if [ `id -u` != "0" ]; then
    echo "Please run as root/sudo!"
    exit 1
fi

# get direct url to download jdk
echo "Enter direct link to download JDK:"
read url

# download jdk
echo "Downloading JDK..."
wget --show-progress -qO jdk-linux.tar.gz $url

# install jdk
echo "Installing JDK..."
mkdir /usr/lib/jvm/
tar -xf jdk-linux.tar.gz -C /usr/lib/jvm/
javaVersion=`tar --exclude="*/*" -tf jdk-linux.tar.gz`
update-alternatives --install /usr/bin/java java /usr/lib/jvm/$javaVersion/bin/java 1
rm jdk-linux.tar.gz
echo -e "Done.\n"

# check java version
java -version