apk --update add open-vm-tools
rc-update -u add open-vm-tools default
service open-vm-tools start
vmware-toolbox-cmd timesync enable
