#! /bin/bash

CUR_DIR=$(pwd)
ROOT_DIR="$CUR_DIR"
_POST="posts"
_SCRIPT="scripts"
SAMPLE="$ROOT_DIR/$_SCRIPT/sample_post.md"
FILE=$ROOT_DIR/$_POST/2017-$1-$2-$3.md
POSTPATH=$_POST/2017-$1-$2-$3.md

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
echo "Title: $SUBJECT"
echo "	* [$SUBJECT]($POSTPATH)" >> SUMMARY.md
echo "	* [To Be Continued]()" >> SUMMARY.md
