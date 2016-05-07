apt-get install -y ubuntu-desktop

USERNAME=vagrant
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=${USERNAME}" >> $GDM_CUSTOM_CONFIG

echo "==> Configuring lightdm autologin"
echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
