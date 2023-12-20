if  pgrep redshift; then 
notify-send "Stop redshift" -a "Night Light Off" -t 2000
killall redshift

else

notify-send "Start redshift" -a "Night Light On" -t 2000
redshift &

fi

