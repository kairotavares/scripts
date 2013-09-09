#!/bin/bash

#Constants
EXTERNAL_IP_FILE=eip.tmp
INTERNAL_IP_FILE=iip.tmp
LOG_FILE=ipchanges.log
SLEEP_TIME=1m

#Commands
DATE=$(date)
EXTERNAL_IP=`external-ip`
TEMP_EXTERNAL_IP=$(cat $EXTERNAL_IP_FILE)
INTERNAL_IP=$(ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
TEMP_INTERNAL_IP=$(cat $INTERNAL_IP_FILE)

#running forever
while [ 1 ]; do
	
	echo "Finding external ip..."
	echo "Founded external ip: $EXTERNAL_IP"

	if [ -e $EXTERNAL_IP_FILE ]
	then
		echo "$EXTERNAL_IP_FILE exits"
	else
		echo "0.0.0.0" > $EXTERNAL_IP_FILE
		echo "$EXTERNAL_IP_FILE created"
	fi

	echo "Previous IP: $TEMP_EXTERNAL_IP"

	if [ "$TEMP_EXTERNAL_IP" = "$EXTERNAL_IP" ]; then
		echo "IPs match"
	else
		echo "[$DATE: EXTERNAL_IP] $TEMP_EXTERNAL_IP to $EXTERNAL_IP" > $LOG_FILE
		echo $EXTERNAL_IP > $EXTERNAL_IP_FILE
		echo "IPs not match"
	fi

	echo "Finding internal ip..."
	echo "Founded internal ip: $INTERNAL_IP"

	if [ -e $INTERNAL_IP_FILE ]
	then
		echo "$INTERNAL_IP_FILE exits"
	else
		echo "0.0.0.0" > $INTERNAL_IP_FILE
		echo "$INTERNAL_IP_FILE created"
	fi

	echo "Previous IP: $TEMP_INTERNAL_IP"

	if [ "$TEMP_INTERNAL_IP" = "$INTERNAL_IP" ]; then
		echo "IPs match"
	else
		echo "[$DATE: INTERNAL_IP] $TEMP_INTERNAL_IP to $INTERNAL_IP" > $LOG_FILE

		echo $INTERNAL_IP > $INTERNAL_IP_FILE
		echo "IPs not match"
		echo "Deleting ip/port forward from upnp table"
		upnpc -d 22221 TCP
		echo "Adding ip/port forward to upnp table"
		upnpc -a $INTERNAL_IP 22 22221 TCP

	fi
	echo "-----------------------------------------"
	sleep $SLEEP_TIME
done