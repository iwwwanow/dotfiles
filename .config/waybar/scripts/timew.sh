#!/bin/sh

# TODO show last active tags

function main() {
	local timewData=`timew`
	timewDataArr=($timewData)

	if [ ${timewDataArr[0]} = 'There' ]; then
		printf '{"text": "%s", "class": "%s"}\n' TIMEW inactive
	else
		local activeCategory
		local output

		for word in ${timewData[@]}; do
			if [ $word = 'Tracking' ]; then
				activeCategory=$word
			elif [ $word = 'Started' ]; then
				activeCategory=$word
			elif [ $word = 'Total' ]; then
				activeCategory=$word
			fi

			if [ $activeCategory = 'Tracking' ]; then
				if [ $word != 'Tracking' ]; then
					output+=$word
					output+=' '
				fi
			fi

			if [ $activeCategory = 'Total' ]; then
				if [ $word != 'Total' ]; then
					output+=$word
				fi
		fi
	done

	printf '{"text": "%s", "class": "%s"}\n' "${output^^}" active
	fi
}

main
