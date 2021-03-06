# Packaging tools

## Useful commands

Install:

    dpkg -i <package>
    rpm -ivh <package>

Remove:

    dpkg -r <package>
    rpm -e <package>

Purge:

    dpkg --purge <package>

    rpm -qc <package>
    ---> remove by hands files on this list <---

All installed:

    dpkg -l
    rpm -qa

Package file content:

    dpkg -c <package>.deb
    rpm -qlp <package>.rpm

File belonging to package:

    dpkg -S <file>
    rpm -qf <file>

Package file dependencies:
 
    dpkg -I <package>.deb
    rpm -qRp <package>.rpm

Informations:

    dpkg -s <package>
    rpm -qi <package>

Package file informations:

    dpkg -I <package>.deb
    rpm -qip <package>.rpm

Files inside a package:

    dpkg -L <package>
    rpm -ql <package>

Recursive install:

    dpkg -R --install <directory>
    ---> RPM install recursively by hand <---

Package file unpack (don't configure):

    dpkg --unpack <package>.deb
    rpm2cpio <package>.rpm | cpio -idmv

Configure/Reconfigure:

    dpkg  --configure <package>

License:

    dpkg --license <package>
    rpm -qa --qf "%{name}: %{license}\n"

