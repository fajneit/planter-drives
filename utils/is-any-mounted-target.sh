#!/bin/sh

BASE="/media/target"

if [ -d $BASE/.support/.files ]; then
	exit 0
elif [ -d $BASE/.files/.data ]; then
	exit 0
elif [ -d $BASE/files/data ]; then
	exit 0
else
	exit 1
fi
