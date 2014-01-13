#!/bin/bash

# budm version 0.2
# copyright 2014 Reid Wicks under GPLv3
# That's there because I think I need to put it there.

# Resources I consulted while creating this script:
# reddit user antenore (http://www.reddit.com/r/linux/comments/1v36dv/i_want_to_create_a_graphical_program_that_will/ceoazx6)
# the manpage for zenity (December 2011)
# https://help.gnome.org/users/zenity/stable/ (2014-01-13)
# the manpage for bash (2010 December 28)
# 

drive=$( zenity --list --title="Please select the drive you wish to use" --column="List of drives on this computer" --radiolist=$( ls /dev/sd? ) )
iso=$( zenity --file-selection --title="Please select the .iso you want to burn" --file-filter=*.iso )
zenity --info --title="Filename" --text="The file you selected is $iso."
#zenity --warning --title="No file selected" --text="You have not selected an iso!"
sudo mkfs.vfat -I /dev/sdb && sudo dd if=$iso of=$drive oflag=direct bs=10M | zenity --progress --title="Creating bootable USB device" --text="The creation of your bootable USB device is in progress..." --pulsate
