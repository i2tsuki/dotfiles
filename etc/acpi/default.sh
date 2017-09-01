#!/bin/sh
# /etc/acpi/default.sh
# Default acpi script that takes an entry for all actions

set $*

group=${1%%/*}
action=${1#*/}
device=$2
id=$3
value=$4

amixer="amixer -q set Master"

log_unhandled() {
	logger "ACPI event unhandled: $*"
}

case "$group" in
	button)
		case "$action" in
			power)
				/etc/acpi/actions/powerbtn.sh
				;;

			# if your laptop doesnt turn on/off the display via hardware
			# switch and instead just generates an acpi event, you can force
			# X to turn off the display via dpms.  note you will have to run
			# 'xhost +local:0' so root can access the X DISPLAY.
			#lid)
			#	xset dpms force off
			#	;;

			lid)
				case "$id" in
					close)
						hibernate-ram
						;;
					open) 
						su kizkoh -c /usr/bin/xtrlock &
						;;
					*) uhd $*;;
				esac
				;;
			
			volumeup) 
				$amixer 5dB+
				;;
			volumedown)
				$amixer 5dB-
				;;
			f20)
				amixer set "Capture" 40
				;;

			*)	log_unhandled $* ;;
		esac
		;;

	ac_adapter)
		case "$value" in
			*0)
				cpupower frequency-set -g powersave
				;;

			*1)
				cpupower frequency-set -g performance
				;;

			*)	log_unhandled $* ;;
		esac
		;;

	video)
		case "$action" in
			brightnessdown)
				/usr/bin/xbacklight -10
				;;
			brightnessup)
				/usr/bin/xbacklight +10
				;;
			*)	
				log_unhandled $*
				;;
		esac
		;;

	*)	log_unhandled $* ;;
esac
