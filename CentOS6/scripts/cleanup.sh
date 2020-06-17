yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*

# clean up redhat interface persistence
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
sudo sed -i 's/^HWADDR.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
sudo sed -i 's/^UUID.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0