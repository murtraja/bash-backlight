# problem
my computer does not respond to the shortcut (fn + f(7|8)) keys to change my laptop's brightness level

upon digging on google, i was able to change it through command line

got the idea of creating a script that will do it for me

# prerequisites
use this at your own risk!

xbacklight did not work for me, if it does for you, then you should not be here

change the permission and owner like so of this file
$ ls -l /sys/class/backlight/acpi_video0/brightness 
-rw-rw-r-- 1 <your_user> root 4096 Oct 11 23:58 /sys/class/backlight/acpi_video0/brightness

if you cannot find the above file, then this solution is not for you

# installation
this works for ubuntu 14.04

download the backlight.sh file and place it in a directory (path is <p>, say)

$ chmod +x <p>/backlight.sh

$ sudo ~/.bashrc

on the last line add: alias bl='<p>/backlight.sh'

restart the terminal

$ bl help

it will display how to use the command

you can even map this command to a hotkey to make setting the brightness very easy