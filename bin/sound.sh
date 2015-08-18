#! /bin/bash
#muh voluum scriprt
ICON=""

while true;
do
	LEVEL=$(amixer sget Master | awk 'FNR == 6 {print $5}' | sed 's/\[//' | sed 's/\]//')
	STATUS=$(amixer sget Master | awk 'FNR == 6 {print $6}' | sed 's/\[//' | sed 's/\]//')
	VOL=$(amixer sget Master | awk 'FNR == 6 {print $5}' | sed 's/\[//' | sed 's/\]//' | sed 's/\%//')
	
	#echo $VOL	# for debug
	#echo $STATUS	# for debug
	
	if [ $STATUS == 'on' ];
		then
			if (( $VOL>'50' ));
				then
					ICON=''
			elif (( $VOL=='50' ));
				then
					ICON=''
			elif (( $VOL<'50' ));
                	        then
					ICON=''
			elif (( $VOL=='0' ));
				then
					ICON=''
			fi
	elif [ $STATUS == 'off' ];
		then
			ICON=''
			LEVEL='N/A'
	fi
	echo v$ICON $LEVEL
	sleep 1
done
