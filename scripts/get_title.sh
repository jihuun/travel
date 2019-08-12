#! /bin/bash
# extract title from the markdown postings
# v 0.1.0

function do_convert {
	cat $a | grep ^title | sed -e 's/title://g'
	echo $a
}

cd $1
echo "Converting file name in the $(pwd)"

for a in $(ls)
do
        do_convert $a
done
