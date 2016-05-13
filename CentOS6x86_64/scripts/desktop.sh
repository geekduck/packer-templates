#!/bin/bash
# Configure gdm autologin.
GDM_CONFIG=/etc/gdm/custom.conf.rpmsave
if [ -f $GDM_CONFIG ]; then
    sudo sed -i s/"daemon]$"/"daemon]\nAutomaticLoginEnable=true\nAutomaticLogin=vagrant"/ /etc/gdm/custom.conf
fi
