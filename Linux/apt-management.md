### apt commands
> To update all packages
````
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
````
> To look for a specfic package in apt cache
> For example: apt-cache search netplan --> neplan.io
````
sudo apt-cache search <available-package-name>
````