#! /bin/bash

ROOT_DIR=/Users/jihuun/project/jihuun.github.io
SAMPLE=_drafts/sample_post.md
POST=_posts
FILE=$ROOT_DIR/$POST/2017-$1-$2-#$3.md

echo File name is $FILE

if [[ -e $FILE ]]; then
	echo "File already exist!"
else
	echo "Generating file $FILE"
	cp $ROOT_DIR/$SAMPLE $FILE

	sed -i "s/MM/$1/g" $FILE
	sed -i "s/DD/$2/g" $FILE
	sed -i "s/AA/$3/g" $FILE
	vi $FILE
fi


