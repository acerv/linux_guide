# Devices handling

## Location
All devices can be found under */dev* and they are created by kernel modules.
*/dev* files are virtual, and they are called *character devices*.

They communicate through */sys* virtual filesystem.

## RAM
To know the RAM type and size:

    sudo dmidecode --type 17

## Serial communication
The serial ports start with *tty* and *serial* prefixes under */dev* directory.
Useful tools for serial communication are:

    minicom -s # configure service and then launch minicom
    minicom
    minicom -D /dev/ttyS0 # overwrite device port
    minicom -C capture.log -D /dev/ttyS0 # to capture strings from serial port
    CTRL + A -> q to exit

    cu -l /dev/<device> -s <baud rate speed>
    cu -l /dev/ttyS0 -s 921600

    screen /dev/<device> <speed>,<packet type>
    screen /dev/ttyS0 19200,cs8

To setup a serial port:
    
    stty -F /dev/ttyS0 speed 921600 cs8

Create a serial loopback (`/dev/serloop0` echo `/dev/serloop1`):

    socat -d -d pty,raw,echo=0,link=/dev/serloop0 \
                pty,raw,echo=0,link=/dev/serloop1

## GPIO communication
The following example is using */sys/class* virtual filesystem to communicate 
with GPIO0:

    cd /sys/class/gpio    // enter the gpio class interface
    echo 0 > export       // create the gpio0
    cd gpio0              // enter the gpio0 class
    echo out > direction  // select the gpio0 direction
    echo 1 > value        // set gpio0 output value to 1

## USB
To get the vendor/product ID:

    sudo cat /sys/kernel/debug/usb/devices | grep -E "^([TSPD]:.*|)$"

