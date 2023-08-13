### To view existing disk settings
````
lsblk
df -h (human readable form) -T (print the type) -l (local only)
du -h --max-depth=1 / (To View which folder/file is utilizing how much storage)
````
###  To extend an existing disk
````
sudo pvresize /dev/sda3
lvextend -l+100%FREE /dev/ubuntu-vg/ubuntu-lv
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
````
### To mount an ISO
````
mount -o loop <ISO FILE.iso> /mnt
````
### Copy items from one folder to another
````
rsync -av /source /dst
````
### To check what service using the network port
````
sudo lsof -i:<portnumber>
````
### Rename all the files to lowercase
````
for file in *; do mv -v "$file" "${file,,}"; done
````
### To commit git files using SUDO
> Assuming you already have the git initial global configuration done
````
alias gsudo='sudo git -c "include.path='"${XDG_CONFIG_DIR:-$HOME/.config}/git/config\" -c \"include.path=$HOME/.gitconfig\""
````
> Confirm the settings
````
gsudo config --list --show-origin --includes | less
````
### Configure NTP Timezone
````
sudo dpkg-reconfigure tzdata
sudo hwclock --show
````
### Configure network without netplan
````
ifconfig <interface> up
ifconfig <interface> <ip address> netmask <subnet mask>
ip route (to view routes available)
ip route add default via <network gateway>
````