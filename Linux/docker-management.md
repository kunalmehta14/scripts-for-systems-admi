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
## Resolving Permission Error:
> Error: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/json: dial unix /var/run/docker.sock: connect: permission denied
````
sudo chmod 666 /var/run/docker.sock
````
