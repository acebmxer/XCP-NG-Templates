echo "Installing Xen Guest Tools"
sudo apt install xe-guest-utilities
echo "Install cloud-init"
sudo apt install cloud-init
echo "Install cloud-initramfs-growroot"
sudo apt install cloud-initramfs-growroot
echo "Reconfigure cloud-init"
sudo dpkg-reconfigure cloud-init
echo "Remove execute permission from /etc/cloud/clean.d/99-installer"
sudo chmod a-x /etc/cloud/clean.d/99-installer
echo "Remove /etc/cloud/cloud.cfg.d/99-installer.cfg"
sudo rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg
echo "Remove /etc/cloud/cloud.cfg.d/90-installer-network.cfg"
sudo rm -f /etc/cloud/cloud.cfg.d/90-installer-network.cfg
echo "Clean cloud-init logs and seed"
cloud-init clean --logs --seed
echo "Remove /var/lib/cloud/instances and /var/lib/cloud/instance"
sudo rm -rf /var/lib/cloud/instances /var/lib/cloud/instance
echo "Remove /var/log/cloud-init.log and /var/log/cloud-init*"
sudo rm -rf /var/log/cloud-init.log /var/log/cloud-init*
echo "Remove /etc/netplan/50-cloud-init.yaml"
sudo rm -f /etc/netplan/50-cloud-init.yaml
echo "Remove /etc/cloud/cloud.cfg.d/90-installer-network.cfg"
sudo rm -f /etc/cloud/cloud.cfg.d/90-installer-network.cfg
echo "Truncate /etc/machine-id"
sudo truncate -s 0 /etc/machine-id
echo "Clean apt cache"
sudo apt-get clean
echo "Delete SSH host keys"
sudo find /etc/ssh/ -type f -name 'ssh_host_*' -delete
echo "Shuting down the server now"
sudo shut down now
