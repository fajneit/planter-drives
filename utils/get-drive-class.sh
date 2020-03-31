#!/bin/sh

UUID=$1

if [ "$UUID" = "" ]; then
	echo "error"
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/ignore.list`" != "" ]; then
	echo "ignore"
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/target.list`" != "" ]; then
	echo "target"
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/source.list`" != "" ]; then
	echo "source"
else
	echo "unknown"
fi
