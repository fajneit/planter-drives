#!/bin/sh

DEVICE=$1
FALLBACK="/media/fallback"

if [ "$DEVICE" = "" ]; then
	echo "error"
	exit 0
fi

UUID="`grep $DEVICE /run/planter.mounts |cut -d: -f2`"

if [ "$UUID" = "" ]; then
	echo "error"
	exit 0
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/ignore.list`" != "" ]; then
	echo "ignore"  # this shouldn't ever happen, but...
	exit 0
fi

umount -l $DEVICE
sed -i -e "/$UUID/d" /run/planter.mounts


if [ "`echo $UUID |grep -ixFf /etc/planter/drives/target.list`" != "" ]; then
	echo "target"
	rm -f /media/target
	ln -s $FALLBACK /media/target
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/source.list`" != "" ]; then
	echo "source"
	rm -f /media/source
fi
