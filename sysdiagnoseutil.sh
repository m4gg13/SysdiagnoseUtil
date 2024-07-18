#!/bin/bash

if [[ $1 = "-h" || $1 = "--help" ]]; then
	echo "
	usage: sh sysdiagnoseutil.sh good-state-sysdiagnose current-state-sysdiagnose output-directory
	"
fi

DEFAULT_DIR=$1
CURRENT_DIR=$2
OUTPUT_DIR=$3

if [[ $DEFAULT_DIR = "" ]]; then
	exit 1
elif [[ $CURRENT_DIR = "" ]]; then
	exit 1
elif [[ $OUTPUT_DIR = "" ]]; then
	OUTPUT_DIR="/tmp/sysdiagnoseutil_output"
fi

echo 'current directory:' 
echo $CURRENT_DIR

if [ -d $CURRENT_DIR ]; then
	echo 'exists'
else
	echo 'does not exist'
fi

LATER_DIRS=()

traverse_dir () {
	for f in $(ls $CURRENT_DIR); do
		echo $CURRENT_DIR/$f
		if [ -d $CURRENT_DIR/$f ]; then
			LATER_DIRS+=("$f")
		elif [ -e $CURRENT_DIR/$f ]; then
			diff=$(diff $CURRENT_DIR/$f $DEFAULT_DIR/$f)
			if [[ "$diff" = "" || "$diff" = "\n" || "$diff" = "\r" || "$diff" = "\7" ]]; then
				echo 'diff is empty'
			fi
			mkdir -p $OUTPUT_DIR
			echo $diff > $OUTPUT_DIR/$f
		else
			echo 'does not exist'
		fi
	done
}

traverse_dir

DEFAULT_DIR_TMP=$DEFAULT_DIR
CURRENT_DIR_TMP=$DEFAULT_DIR
OUTPUT_DIR_TMP=$OUTPUT_DIR

for s in ${LATER_DIRS[@]}; do
	DEFAULT_DIR=$DEFAULT_DIR_TMP/$s
	CURRENT_DIR=$CURRENT_DIR_TMP/$s
	OUTPUT_DIR=$OUTPUT_DIR/$s
	traverse_dir
done
