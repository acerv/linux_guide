# Networking tools

## SSH - Secure Shell

To run commands on target:
    
    ssh <username>@<target IP> <command to execute>

To run tests, copy & execute scripts/programs:

    scp <script> <username>@<target IP>:/tmp/<script>
    ssh <username>@<target IP> /tmp/<script>

To run a script on a linux target:

    ssh <username>@<target IP> 'bash -s' < local-script.sh

To authorize SSH access without user & pass credentials:

    # on client
    # create the key
    ssh-keygen -t rsa -b 4096
    
    # transfer client key to the host
    ssh-copy-id <user>@<ip>

## Creating a bridge

Create the bridge network interface:

     brctl addbr br0
     
Bridge eth1 over eth0 through br0:

     brctl addif br0 eth0 eth1
     ip link set br0 up
     dhclient br0
