#! /bin/bash
#muh amazign bwightnus script

while true;

do
	BACK=$(xbacklight | awk 'BEGIN {FS="."}{print $1}')
	echo b $BACK%
	sleep 1
done
