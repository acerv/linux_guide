#!/bin/bash
#
# Description: This script is used to find the rpm package that owns 
# a particular file.

if [[ -z $1 || -z $2 ]]; then
	printf "Usage: find-rpm-owner.sh <src path> <reg exp>\n"
	exit
fi

for file in `find $1 -iname '*.rpm'`;  do
	rpm -qlp $file | grep $2

	if [ $? -eq 0 ]; then
		echo "|"
		echo "|-> is in " $file
		echo ""
	fi
done
