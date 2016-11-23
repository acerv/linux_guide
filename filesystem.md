# Filesystem handling

## Hierarchy

|  Path   | Porpose                                                  |
|---------|----------------------------------------------------------|
|  /bin   | essential command binaries                               |
|  /boot  | bootloader files                                         |
|  /dev   | device files                                             |
|  /proc  | the virtual filesystem for processes                     |
|  /sys   | the virtual filesystem used to communicate with devices  |
|  /etc   | specific configurations                                  |
|  /lib   | essential shared libs and kernel modules                 |
|  /media | removable media mount points                             |
|  /mnt   | temporary mount points for filesystems                   |
|  /opt   | optional softwares                                       |
|  /sbin  | system binaries                                          |
|  /srv   | data for services                                        |
|  /tmp   | temporary data                                           |
|  /user  | secondary hierarchy for users                            |
|  /var   | variable data                                            |
|  /home  | home directories                                         |
|  /root  | root home directory                                      |

## Create/Repair

To create a filesystem:
```sh
    mkfs -t <filesystem type> <device>
```

To check/repair the filesystem:
```
    fsck <device>

    0   - No errors
    1   - FS corrected
    2   - System should be rebooted
    4   - FS errors left uncorrected
    8   - Operational error
    16  - Usage or syntax error
    32  - Fsck canceled by the user
    128 - Shared-library error

    Useful options:

        -A: global check
        -R: exclude root path from checking
        -M: don't run on mounted fs
        -t: specify the filesystem. Placing 'no' prefix in front of 
            the fs name (i.e. 'noext3') will exclude that specific filesystem.
        -y: automatically resolve problems
        -a: automatically repair damaged portions
        -n: avoid repair, but prompt only
```

## Partitioning

For text-based tool for partitioning:
```sh
    fdisk [-l] <device>  # use -l to list all the partitions
    > m                    # show help message
```
For ncurses tool for partitioning:
```sh
    cfdisk <device>
```

## Mounting

To mount a filesystem in a binary format (.iso, .bin, .extX etc.):
```sh
    mount [-r] -o loop <file> <directory>   # use -r for read-only
    mount -t proc  /proc <directory>/proc/
    mount -t sysfs /sys  <directory>/sys/
    mount -o bind  /dev  <directory>/dev/
```
To mount a network filesystem:
```sh
    mount -o tcp <address>:<remote path> <local path>
```
To automatically mount a filesystem using /etc/fstab:
```
    ...
    /dev/sdX   /data   ext4   defaults,auto   0 0
```

## CPIO

To extract a cpio image inside the current directory:
```sh 
    cpio -idv < file.cpio
```
## Recovery

To recover deleted files, use the testdisk tool:
```
    testdisk
    Create -> Disk /dev/sdX -> Intel -> Advanced -> Select List Option
```
A file manager will apear, showing deleted files in "red" color.
```
    'c' over the file to recover -> select output directory -> 'c'
```

## Installation Setup

The following partitioning scheme can be used as reference for a server setup:

| Path  | Size  | Type    |
|-------|-------|---------|
| /boot | 500MB | Primary |
| /     |  30GB | Primary |
| /var  |  50GB | Logical |
| swap  |   4GB | Logical |
| /home | 165GB | Logical |
