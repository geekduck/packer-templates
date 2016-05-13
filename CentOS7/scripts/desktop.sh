#!/bin/bash

cat /etc/redhat-release
if grep -q -i "release 7" /etc/redhat-release ; then
    sudo systemctl get-default
    sudo systemctl set-default graphical.target
fi

# Configure gdm autologin.
GDM_CONFIG=/etc/gdm/custom.conf.rpmsave
if [ -f $GDM_CONFIG ]; then
    sudo sed -i s/"daemon]$"/"daemon]\nAutomaticLoginEnable=true\nAutomaticLogin=vagrant"/ /etc/gdm/custom.conf
fi
