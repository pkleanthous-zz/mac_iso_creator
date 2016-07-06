r=n
path=$1
disk=$2 
while [ "$r" != "y" ]; do
	echo "Please veriry the followings"
	echo "ISO path: ""$iso_path"""
	echo "USB stick: ""$iso_disk"" " 
	read -p "[y/n]:" r
	if [ "$r" == "n" ]
		then
			read -p "Please enter ISO path: " path
			read -p "Please enter USB path: " disk
		fi
done
echo "***WARNING*** You are going to format ""$iso_disk"" "
read -p "Confirm again [y/n]: " r
	if [ "$r" == "y" ]
		then
			echo "Converting the ISO file"
			hdiutil convert -format UDRW -o "USB.img" "$iso_path"
            diskutil unmountDisk $iso_disk
			mv "USB.img.dmg" "USB.img"
			echo "Writing ISO to USB. Please be patient..."
            sudo dd if="USB.img" of="$iso_disk" bs=1m
            diskutil eject $iso_disk
            echo "Your Bootable USB is ready!"
	else
		echo "EXIT without writing anything"
	fi
