apt-get -y autoremove
apt-get -y clean

echo "cleaning up gest additions"
rm -rf VBoxGuestAdditions*.iso VBoxGuestAdditions*.iso.?

# echo "cleaning up dhcp leases"
# rm /var/lib/dhcp/*

#echo "cleaning up udev rules"
#rm /etc/udev/rules.d/70-persistent-net.rules
#mkdir /etc/udev/rules.d/70-persistent-net.rules
#rm -rf /dev/.udev/
#rm /lib/udev/rules.d/75-persistent-net-generator.rules
