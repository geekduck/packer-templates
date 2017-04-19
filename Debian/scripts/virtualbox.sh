export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
apt-get update
apt-get -y install build-essential module-assistant dkms
m-a prepare
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
