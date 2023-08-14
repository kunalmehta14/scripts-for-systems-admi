### Configure network without netplan
````
ifconfig <interface> up
ifconfig <interface> <ip address> netmask <subnet mask>
ip route (to view routes available)
ip route add default via <network gateway>
````