### To create a new user
````
sudo adduser <username>
````
### To give a user sudo permissions
````
sudo usermod -aG sudo <username>
````
### To create a new group
````
sudo addgroup <groupname>
````
### To add users to a group
````
sudo usermod -aG sudo <groupname> <username>
````
### Add group as sudo group
> Edit the visudo configuration file
````
sudo visudo
````
> Add the following to the configuration file
````
%<groupname>   ALL=(ALL:ALL) ALL
````
### Managing Permissions on a directory
> 770 Breakdown: 7 = gives full read (4), write (2) and execute (1) to the owner | 7 = gives full read (4), write (2) and execute (1) permissions to the group | 0 = No permission for others
````
sudo chown :<groupname> /<dir-path>
sudo chmod 770 /<dir-path>
```` 
> If you want to give other users, outside of the group permissions to read, it has to be read and execute: 775: 5 = (4) read and (1) execute
