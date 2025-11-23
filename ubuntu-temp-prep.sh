echo "Installing Xen Guest Tools"
sudo apt install xe-guest-utilities
echo "Install cloud-init"
sudo apt install cloud-init
echo "Install cloud-initrafs-growroot"
sudo apt install cloud-initramfs-growroot
sudo dpkg-reconfigure cloud-init
sudo chmod a-x /etc/cloud/clean.d/99-installer
sudo rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg
sudo rm -f /etc/cloud/cloud.cfg.d/90-installer-network.cfg
cloud-init clean --logs --seed
sudo rm -rf /var/lib/cloud/instances /var/lib/cloud/instance
sudo rm -rf /var/log/cloud-init.log /var/log/cloud-init*
sudo rm -f /etc/netplan/50-cloud-init.yaml
sudo rm -f /etc/cloud/cloud.cfg.d/90-installer-network.cfg
sudo truncate -s 0 /etc/machine-id
sudo apt-get clean
sudo find /etc/ssh/ -type f -name 'ssh_host_*' -delete
sudo shutdown now
