apt update
apt install wireguard
apt install resolvconf
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& random.trust_cpu=off/' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX="[^"]*/& random.trust_cpu=off/' /etc/default/grub
sysctl -w net.ipv4.ip_forward=1
sysctl -p
echo "this system will now reboot to save changes"
reboot
update-grub
