## Install Docker Daemon
> To install docker daemon  
````
wget https://get.docker.com -O dockerinstall.sh
chmod +x dockerinstall.sh
sudo ./dockerinstall.sh
````
## Using Docker without sudo
> To use docker without sudo user, following the steps below:
````
sudo groupadd docker
sudo usermod -aG docker $USER
````
> After successfully running the above commands, restart the docker host.
> In some additional cases, you might need to give docker group access to the docker.sock:
````
sudo chown root:docker /var/run/docker.sock
sudo chown -R root:docker /var/run/docker
````
