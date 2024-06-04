#!/usr/bin/env bash

bugsh="$1"
log="log.txt"; > "$log"	# clear file
cnt=0
ret=0

echo "Start run $bugsh ..."

while [[ $ret -ne 1 ]]
do
	bash "$bugsh" >> "$log" 2>> "$log"; ret=$?
	cnt=$(("$cnt"+1))
	echo "Exec bash $bugsh $cnt"
done

echo "Finish run $bugsh"
echo "Total: $cnt"
echo "Log file: $log"
