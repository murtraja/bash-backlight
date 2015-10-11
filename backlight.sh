#!/bin/bash
file_path="/sys/class/backlight/acpi_video0/brightness"

echo $1 | grep -q "^\([0-9]\|10\)$"
if [ $? -eq 0 ]
	then
	echo $1 > $file_path
elif [ "$1" == "i" ]
	then
	value=$(<$file_path)
	if [ $value -lt 10 ] 
		then
		echo $(($value+1)) > $file_path
	fi
elif [ "$1" == "d" ]
	then
	value=$(<$file_path)
	if [ $value -gt 0 ]
		then
		echo $((value-1)) > $file_path
	fi
elif [ $# -eq 0 ]
	then
	value=$(<$file_path)
	echo "$value"
else
	echo -e "usage: bl [\e[4mvalue\e[0m|i|d]"
	echo "shows current backlight brightness level"
	echo "value: integer between 0 - 10 (both inclusive)"
	echo "i: increments brightness by 1"
	echo "d: decrements brightness by 1"
	
fi