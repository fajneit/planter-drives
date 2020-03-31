#!/bin/sh

UUID=$1

if [ "$UUID" != "" ] && [ "`echo $UUID |grep -ixFf /etc/planter/drives/ignore.list`" != "" ]; then
	exit 0
else
	exit 1
fi
