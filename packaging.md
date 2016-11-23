# Packaging tools

## Useful commands

Install:
```sh
    dpkg -i <package>
    rpm -ivh <package>
```
Remove:
```sh
    dpkg -r <package>
    rpm -e <package>
```
Purge:
```sh
    dpkg --purge <package>

    rpm -qc <package>
    ---> remove by hands files on this list <---
```
All installed:
```sh
    dpkg -l
    rpm -qa
```
Package file content:
```sh
    dpkg -c <package>.deb
    rpm -qlp <package>.rpm
```
File belonging to package:
```sh
    dpkg -S <file>
    rpm -qf <file>
```
Package file dependencies:
```sh 
    dpkg -I <package>.deb
    rpm -qRp <package>.rpm
```
Informations:
```sh
    dpkg -s <package>
    rpm -qi <package>
```
Package file informations:
```sh
    dpkg -I <package>.deb
    rpm -qip <package>.rpm
```
Files inside a package:
```sh
    dpkg -L <package>
    rpm -ql <package>
```
Recursive install:
```sh
    dpkg -R --install <directory>
    ---> RPM install recursively by hand <---
```
Package file unpack (don't configure):
```sh
    dpkg --unpack <package>.deb
    rpm2cpio <package>.rpm | cpio -idmv
```
Configure/Reconfigure:
```sh
    dpkg  --configure <package>
```
License:
```sh
    dpkg --license <package>
    rpm -qa --qf "%{name}: %{license}\n"
```
