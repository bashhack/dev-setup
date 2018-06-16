#!/bin/bash

# Ask for the admin password
sudo -v

# Keep-alive: update existing `sudo` time stamp until `linuxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Updating and upgrading Linux packages."
echo "------------------------------"

sudo apt update
sudo apt upgrade -y

echo ""
echo "------------------------------"
echo "Installing Linux developer tools and compilers."
echo "------------------------------"

sudo apt install build-essential -y
sudo apt install git -y
sudo apt install tmux -y
sudo apt install wget -y
sudo apt install curl -y
sudo apt install cmake -y
sudo apt install make -y
sudo apt install clang -y
sudo apt install gcc -y
sudo apt install llvm -y
sudo apt install libssl-dev -y
sudo apt install zlib1g-dev -y
sudo apt install libbz2-dev -y
sudo apt install libreadline-dev -y
sudo apt install libsqlite3-dev -y
sudo apt install libncurses5-dev -y
sudo apt install libncursesw5-dev -y
sudo apt install xz-utils -y
sudo apt install tk-dev -y
curl https://krypt.co/kr | sh

echo ""
echo "------------------------------"
echo "Installing Ubuntu-specific tools and apps."
echo "------------------------------"

sudo apt install gnome-tweak-tool -y
sudo apt install tlp tlp-rdw -y
sudo apt install tp-smapi-dkms acpi-call-dkms smartmontools -y
sudo tlp start

echo ""
echo "------------------------------"
echo "Installing i3-gaps and configuring DM."
echo "------------------------------"

sudo apt install libxcb1-dev -y
sudo apt install libxcb-keysyms1-dev -y
sudo apt install libpango1.0-dev -y
sudo apt install libxcb-util0-dev -y
sudo apt install libxcb-icccm4-dev -y
sudo apt install libyajl-dev -y
sudo apt install libstartup-notification0-dev -y
sudo apt install libxcb-randr0-dev -y
sudo apt install libev-dev -y
sudo apt install libxcb-cursor-dev -y
sudo apt install libxcb-xinerama0-dev -y
sudo apt install libxcb-xkb-dev -y
sudo apt install libxkbcommon-dev -y
sudo apt install libxkbcommon-x11-dev -y
sudo apt install autoconf -y
sudo apt install libxcb-xrm0 -y
sudo apt install libxcb-xrm-dev -y
sudo apt install automake -y
sudo apt install xutils-dev libtool -y
sudo apt install i3status -y
sudo apt install rofi -y
sudo apt install scrot -y
sudo apt install gimp -y
sudo apt install i3lock -y

# polybar
sudo apt install cmake-data -y
sudo apt install libcairo2-dev -y
sudo apt install libxcb1-dev -y
sudo apt install libxcb-ewmh-dev -y
sudo apt install libxcb-icccm4-dev -y
sudo apt install libxcb-image0-dev -y
sudo apt install libxcb-randr0-dev -y
sudo apt install libxcb-util0-dev -y
sudo apt install pkg-config -y
sudo apt install python-xcbgen -y
sudo apt install xcb-proto -y
sudo apt install libxcb-xrm-dev -y
sudo apt install libxcb-cursor-dev -y
sudo apt install libxcb-xkb-dev -y
sudo apt install i3-wm -y
sudo apt install libjsoncpp-dev -y
sudo apt install libasound2-dev -y
sudo apt install libpulse-dev -y
sudo apt install libmpdclient-dev -y
sudo apt install libiw-dev -y
sudo apt install libcurl4-openssl-dev -y
sudo apt install feh -y
sudo apt install compton -y
sudo apt install unifont -y
sudo apt install fonts-font-awesome -y

git clone --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install
cd ~

# TODO: make script executable for chmod +x bar.sh spoty.sh
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps/
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd ~

cp -r init/i3/config ~/.config/i3/
cp -r init/i3/spoty.sh ~/.config/i3/
cp -r init/i3/bar.sh ~/.config/i3/
cp -r init/polybar/config ~/.config/polybar/
cp -r init/vapor.jpg ~/Pictures/
