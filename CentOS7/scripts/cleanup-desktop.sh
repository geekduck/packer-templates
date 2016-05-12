yum -y erase avahi freetype
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*

# clean up redhat interface persistence
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
ETHDEV=`ls /etc/sysconfig/network-scripts/ifcfg-* | grep -v lo`
sudo sed -i 's/^HWADDR.*$//' $ETHDEV
sudo sed -i 's/^UUID.*$//' $ETHDEV
