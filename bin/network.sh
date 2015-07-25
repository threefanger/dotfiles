#!/bin/bash

. panel_colors
# WIFI ICONS
# 

WIFISTATUS=$(cat /sys/class/net/wlp3s0b1/operstate 2>/dev/null)
QUAL=`iwconfig wlp3s0b1 2>/dev/null | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $3}'`
MAX=`iwconfig wlp3s0b1 2>/dev/null | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $4}'`

IP=$(ifconfig | grep inet | grep -v inet6 | grep -v 127.0.0.1 | grep -v 192.168.122.1 | grep -v 10.8.* | awk '{print $2}' | xargs echo -n)
#ifconfig wlp3s0b1 | grep inet | grep -v inet6 | awk '{print $2}'
ETHSTATUS=$(cat /sys/class/net/enp2s0f0/operstate)
VPNSTATUS=
if [ -d "/sys/class/net/tun0" ];then
	VPNSTATUS="up"
else
	VPNSTATUS="down"
fi

# host we want to "reach"
host=google.com

# get the ip of that host (works with dns and /etc/hosts. In case we get multiple ipaddresses, we just want one of them
host_ip=$(getent ahosts "$host" | head -1 | awk '{print $1}')

# only list the interface used to reach a specific host/IP. We only want the part between dev and src (use grep for that)
activeiface=$(ip route get "$host_ip" | grep -Po '(?<=(dev )).*(?= src)')

icon=""
vpnicon=""

if [ "$WIFISTATUS" == "up" ] 
then
	activeiface=$(iwconfig | grep ESSID | sed -e 's/.*ESSID:"\(.*\)".*/\1/')
	PERC=`echo $QUAL*100/$MAX | bc`
	case $PERC in
		[0-4])
			icon=""
		;;
		[4-9])
			icon=""
		;;
		[2-3]*)
			icon=""
		;;
		[4-5]*)
			icon=""
		;;
		[6-7]*)
			icon=""
		;;
		*)
			icon=""
		;;
esac
fi

if [ "$ETHSTATUS" == "up" ] 
then
	icon=""
	#echo lol
fi

if [ "$VPNSTATUS" == "up" ] 
then
	vpnicon="%{F$COLOR_ICON}%{F-}"
	#echo lol
else
	vpnicon="%{F$COLOR_URGENT}%{F-}"
fi


if [ "$ETHSTATUS" == "down" ] && [ "$WIFISTATUS" == "down" ]
then
	icon=""
	#echo lol
fi

echo "N%{F$COLOR_ICON}$icon%{F-} $activeiface$vpnicon"
# echo "N%{F$COLOR_ICON}$icon%{F-} $IP $vpnicon"

#%{A:reboot:} Click here to reboot %{A}