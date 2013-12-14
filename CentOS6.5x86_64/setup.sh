#!/bin/bash

sudo sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
sudo sed -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config

#sudo sh -c 'echo "[epel]" >> /etc/yum.repos.d/epel.repo'
#sudo sh -c 'echo "name=epel" >> /etc/yum.repos.d/epel.repo'
#sudo sh -c 'echo "baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch" >> /etc/yum.repos.d/epel.repo'
#sudo sh -c 'echo "enabled=0" >> /etc/yum.repos.d/epel.repo'
#sudo sh -c 'echo "gpgcheck=0" >> /etc/yum.repos.d/epel.repo'

sudo yum -y install wget
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm --upgrade --verbose --hash epel-release-6-8.noarch.rpm  remi-release-6.rpm rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

sudo sed -i -e "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/rpmforge.repo
sudo sed -i -e "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/epel.repo
sudo sed -i -e "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/remi.repo

sudo yum -y install gcc make automake autoconf libtool gcc-c++ kernel-headers-`uname -r` kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel nfs-utils bind-utils

sudo yum -y --enablerepo=epel,rpmforge,remi install dkms curl

sudo yum -y upgrade

sudo yum -y update

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

cd /tmp
sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt
#rm -rf /home/vagrant/VBoxGuestAdditions*.iso

sudo /etc/rc.d/init.d/vboxadd setup

# clean up redhat interface persistence
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
sudo sed -i 's/^HWADDR.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
sudo sed -i 's/^UUID.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
