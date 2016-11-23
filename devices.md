# Devices handling

## Location
All devices can be found under */dev* and they are created by kernel modules.
*/dev* files are virtual, and they are called *character devices*.

They communicate through */sys* virtual filesystem.

## Serial communication
The serial ports start with *tty* and *serial* prefixes under */dev* directory.
Useful tools for serial communication are:

    ```sh
    minicom -s # configure service and then launch minicom
    minicom
    CTRL + A -> q to exit
    ```

    ```sh
    cu -l /dev/<device> -s <baud rate speed>
    cu -l /dev/ttyS0 -s 921600
    ```

    ```sh
    screen /dev/<device> <speed>,<packet type>
    screen /dev/ttyS0 19200,cs8
    ```

## GPIO communication
The following example is using */sys/class* virtual filesystem to communicate 
with GPIO0:

    ```sh
    # cd /sys/class/gpio    // enter the gpio class interface
    # echo 0 > export       // create the gpio0
    # cd gpio0              // enter the gpio0 class
    # echo out > direction  // select the gpio0 direction
    # echo 1 > value        // set gpio0 output value to 1
    ```

## USB
To get the vendor/product ID:

    ```sh
    sudo cat /sys/kernel/debug/usb/devices | grep -E "^([TSPD]:.*|)$"
    ```
