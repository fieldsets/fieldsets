#!/bin/sh

echo 'Run as root using command `sudo bash`'

# common vars
wsl='/etc/wsl.conf'
resolv='/etc/resolv.conf'

# remove standard files
rm -f $wsl
rm -f $resolv

cd "${0%/*}";
cd ../config/

sudo bash

# Create custom WSL name resolution
cp ./wsl.conf $wsl
cp ./resolv.conf $resolv

# This prevents resolv.conf from being deleted when WSL starts
chattr +i $resolv

echo 'WSL name resolution configured'
echo 'Restarting WSL on Windows: "wsl --shutdown"'
