#! /bin/bash
#muh amazign clock script


while true;
do
	TIME=$(date | awk '{print $4}')
	echo S $TIME
	sleep 1
done
