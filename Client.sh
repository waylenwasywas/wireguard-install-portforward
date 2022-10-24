apt update
apt install wireguard
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& random.trust_cpu=off/' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX="[^"]*/& random.trust_cpu=off/' /etc/default/grub
sysctl -w net.ipv4.ip_forward=1
update-grub
