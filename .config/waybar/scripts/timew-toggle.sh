#!/bin/sh

function main() {
	local timewData=`timew`
	timewDataArr=($timewData)

	if [ ${timewDataArr[0]} = 'There' ]; then
		timew continue
		notify-send "timew continue" -i 1
	else 
		timew stop
		notify-send "timew stopped" -i 1
	fi
}

main
