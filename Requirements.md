## Install Locales
```
locale
sudo locale-gen "en_US.UTF-8"
sudo dpkg-reconfigure locales
```
## Add swap
https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04

```
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
sudo nano /etc/sysctl.conf
vm.swappiness=10
vm.vfs_cache_pressure=50
```

## Setup Server
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

```
adduser sammy
usermod -aG sudo sammy
```

