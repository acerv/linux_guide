# Network remote tools

## SSH - Secure Shell

To run commands on target:
    
    ssh <username>@<target IP> <command to execute>

To run tests, copy & execute scripts/programs:

    scp <script> <username>@<target IP>:/tmp/<script>
    ssh <username>@<target IP> /tmp/<script>

To run a script on a linux target:

    ssh <username>@<target IP> 'bash -s' < local-script.sh
