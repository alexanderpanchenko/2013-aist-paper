#!/bin/bash
if ["$1" == ""]; then
	echo "Converts one EPS file to PDF"
	echo "Usage: one.sh eps-file-to-convert"
else 
	echo "Processing "$1
	tmp="$1.tmp"
	eps2eps $1 $tmp
	rm -f $1 
	mv $tmp $1
	epstopdf $1
	echo "Done!"
fi


