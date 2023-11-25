Instructions taken from https://askubuntu.com/questions/645/how-do-you-reset-a-usb-device-from-the-command-line

-------

1. Compile the program:

    $ cc usbreset.c -o usbreset

2. Get the Bus and Device ID of the USB device you want to reset:

    $ lsusb  
    Bus 002 Device 003: ID 0fe9:9010 DVICO  

3. Make our compiled program executable:

    $ chmod +x usbreset

4. Execute the program with sudo privilege; make necessary substitution for <bus> and <device> ids as found by running the lsusb command:

    $ sudo ./usbreset /dev/bus/usb/<bus>/<device>
