#!/bin/sh

UUID=$1

if [ "$UUID" = "" ]; then
	exit 1
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/ignore.list`" != "" ]; then
	exit 0
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/target.list`" != "" ]; then
	exit 0
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/source.list`" != "" ]; then
	exit 0
else
	exit 1
fi
