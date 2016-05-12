#!/bin/bash

cat /etc/redhat-release
if grep -q -i "release 7" /etc/redhat-release ; then
    # set the graphical.target for systemd so it will run startx on boot
    sudo ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target
fi

# Configure gdm autologin.
GDM_CONFIG=/etc/gdm/custom.conf.rpmsave

if [ -f $GDM_CONFIG ]; then
    sudo sed -i s/"daemon]$"/"daemon]\nAutomaticLoginEnable=true\nAutomaticLogin=vagrant"/ /etc/gdm/custom.conf
fi
