#!/usr/bin/env bash

dir=$1

if [ ! -n "$dir" ]; then
	echo "usage: "$0" [directory]"
	exit
fi

find "$dir" -type f -print0 | xargs -0 ls -lt
