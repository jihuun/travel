#! /bin/bash

_YEAR="2017"
CUR_DIR=$(pwd)
ROOT_DIR="$CUR_DIR"
_POST="posts"
_SCRIPT="scripts"
SAMPLE="$ROOT_DIR/$_SCRIPT/sample_post.md"
FILE=$ROOT_DIR/$_POST/$_YEAR-$1-$2-$3.md
POSTPATH=$_POST/$_YEAR-$1-$2-$3.md


remove_last_line() {
	sed -e '$ d' $1 > temp.md
	mv temp.md $1
}

echo File name is $FILE

if [[ -e $FILE ]]; then
	echo "File already exist!"
else
	echo "Generating file $FILE"
	cp $SAMPLE $FILE

	sed -i "s/MM/$1/g" $FILE
	sed -i "s/DD/$2/g" $FILE
	sed -i "s/AA/$3/g" $FILE
	vi $FILE
fi

SUBJECT=$(grep "^# " $POSTPATH | sed -e 's/# //')
remove_last_line SUMMARY.md
echo "Title: $SUBJECT"
echo "	* [$SUBJECT]($POSTPATH)" >> SUMMARY.md
echo "	* [To Be Continued]()" >> SUMMARY.md
