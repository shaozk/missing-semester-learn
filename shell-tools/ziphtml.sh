#!/usr/bin/env bash

dir=$1
htmlsuffix="*.html"
zipname="html.zip"

if [ ! -n "$dir" ]; then
	echo "usage: ziphtml.sh [directory]"
	exit
fi

find "$dir" -name "$htmlsuffix" -type f | xargs zip "$zipname" -r
