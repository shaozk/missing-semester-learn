#!/bin/bash

marco () {
	gdir="$(pwd)" || exit
	echo "marco $(pwd)"
}

polo () {
	cd "$gdir" || exit
	echo "polo $gdir"
}
