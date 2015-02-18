if ["$1" == ""]; then
	echo "Creates eps and pdf files from dot file"
	echo "Usage: dot2eps.sh input-dot-file"
else 
	file_dot=$1
	file=${1%%.*}
	echo "Processing " $file_dot
	
	dot -Tpng $file_dot -o "$file.png"
	iconvert "$file.png" "$file.eps"
	eps2eps "$file.eps" "$file.tmp"
	rm "$file.eps"
	mv "$file.tmp" "$file.eps"
	epstopdf "$file.eps"
	rm "$file.png"
	echo "Done!"
	s "$file.eps"
fi
