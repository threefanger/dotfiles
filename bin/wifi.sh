#! /bin/bash
#muh amazign weefee script

while true;

do
	SIGQUAL=$(iw wlp1s0 link | grep signal | sed 's/\tsignal: //')
	echo $SIGQUAL
	sleep 1
done
