#! /bin/bash
#muh amazign clock script


while true;
do
	TIME=$(clock -f "%H:%m:%S")
	echo S $TIME
	sleep 1
done
