# Kernel handling and develpment

## Informations

To show the current kernel version:
```sh
    uname -r
```

## Modules handling

The installed kernel modules are located int the 
*/lib/modules/<kernel version>/build* directory.
```sh
    modinfo [-k <kernel version>] <module>  # info about installed module
    insmod <mod name>.ko                    # load a module into the kernel
    rmmod <mod name>.ko                     # removed a module from the kernel
    modprobe <mod name>                     # load an installed module
    lsmod                                   # list all the loaded modules
```

## Log handling

The kernel levels are the following:

| ID | Level        |
|----|--------------|
| 0  | Emergency    |
| 1  | Alert        |
| 2  | Critical     |
| 3  | Error        |
| 4  | Warning      |
| 5  | Notice       |
| 6  | Informations |
| 7  | Debug        |

*dmesg* is used to show all kernel messages:
```sh
    dmesg
    dmesg -n <log level>                # turn off all levels under it
    echo "N" > /proc/sys/kernel/printk  # same as the command before
```
To emulate printk logging level, echo can be used:
```sh
    echo "<N> Message" > /dev/msg       # show messages under N logging level
```

## Create modules

A great guide can be found [here](http://tldp.org/LDP/lkmpg/2.6/html/lkmpg.html).

The coding style can be found [here](https://www.kernel.org/doc/Documentation/CodingStyle).

## Makefile for cross compiling

The kernel modules Makefile can be setup for cross compiling as following.

```
    obj-m += hello.o
    SYSROOT :=
    KDIR := $(SYSROOT)/usr/src/kernel
    ARCH := x86
    CROSS_COMPILE := i586-poky-linux-

    all: build 

    build:
       make -C $(KDIR) M=$(PWD) modules

    clean:
       make -C $(KDIR) M=$(PWD) clean
```

## Signing kernel modules

A kernel module signing guide can be found [here](https://www.kernel.org/doc/Documentation/module-signing.txt).

Before signing kernel modules, the */usr/src/kernel* directory must be configured
with the following command:
```sh
    sudo make -C /usr/src/kernel scripts
```
Then it's possible to use a Makefile rule for automatic sign, just in case
the kernel module must be loaded manually for tests:
```
    sign:
       env LANG=C perl $(KDIR)/scripts/sign-file sha1 \
                       $(KDIR)/signing_key.priv \
                       $(KDIR)/signing_key.x509 \
                       hello.ko
```
`env LANG=C` is used to avoid perl warnings.
