#!/bin/bash

set -e

# check root permissions
if [ `id -u` == "0" ]; then
    echo "Please run as non root/sudo!"
    exit 1
fi

# download jetbrains toolbox
echo "Downloading JetBrains Toolbox..."
wget --show-progress -qO toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"

# install jetbrains toolbox
echo "Installing JetBrains Toolbox..."
mkdir toolbox/
tar -xf toolbox.tar.gz -C toolbox/
toolbox/*/jetbrains-toolbox
rm toolbox.tar.gz
rm -rf toolbox/
echo "Done."