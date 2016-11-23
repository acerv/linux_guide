# Network remote tools

## SSH - Secure Shell

To run commands on target:
```sh    
    ssh <username>@<target IP> <command to execute>
```
To run tests, copy & execute scripts/programs:
```sh
    scp <script> <username>@<target IP>:/tmp/<script>
    ssh <username>@<target IP> /tmp/<script>
```
