This is very simple script that converts ISO files and write it to a usb stick on Mac OS X.

Open a Terminal 
Run the command: "diskutil list"
Find your USB i.e. "/dev/disk1"

Run the script passing arguments: "sh usb_create.sh ~/Downloads/debian-8.5.0-arm64-netinst.iso /dev/disk1"

