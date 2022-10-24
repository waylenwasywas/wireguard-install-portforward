apt update
apt install wireguard -y
apt install resolvconf -y
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& random.trust_cpu=off/' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX="[^"]*/& random.trust_cpu=off/' /etc/default/grub
sudo systemctl enable wg-quick@wg0.service
sudo systemctl daemon-reload
echo "wireguard has successfully set itself up as a service"
sysctl -w net.ipv4.ip_forward=1
sed -i '/#net.ipv6.conf.all.forwarding=1/s/^#//g' /etc/sysctl.conf
sed -i '/#net.ipv4.ip_forward=1/s/^#//g' /etc/sysctl.conf
sysctl -p
echo "this system will now reboot to save changes"
reboot
update-grub
