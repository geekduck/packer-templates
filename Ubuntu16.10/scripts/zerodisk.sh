dd if=/dev/zero of=/EMPTY bs=1M
sleep 5
rm -f /EMPTY

sync
sync
sync
exit 0
