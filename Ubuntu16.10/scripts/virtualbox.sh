apt-get -y install dkms
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions*.iso

# VirtualBox 5.1.20
if [ ! -f /sbin/mount.vboxsf ] && [ -f /usr/lib/x86_64-linux-gnu/VBoxGuestAdditions/mount.vboxsf ]; then
    ln -sf /usr/lib/x86_64-linux-gnu/VBoxGuestAdditions/mount.vboxsf /sbin/mount.vboxsf
fi
