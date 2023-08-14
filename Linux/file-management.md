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