#! /bin/bash
while true;
do
	SPEED=$(sensors | grep Processor | sed 's/Processor Fan:\ \ \ \ //' | sed 's/Processor Fan:\ //')
	PID=$(ps aux | grep -i lemonbar | grep '110x60+1790+50' | awk '{print $2}')
	echo %{c}%{A:kill $PID:i} $SPEED%{A}
	#echo %{c}%{A:kill $PID:i} $PID %{A}

	sleep 1
done
