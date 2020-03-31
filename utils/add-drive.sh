#!/bin/sh

DEVICE=$1
FSTYPE=$2
UUID=$3
MOUNTPOINT=$4

if [ "$UUID" = "" ] || [ "$MOUNTPOINT" = "" ]; then
	echo "error"
	exit 0
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/ignore.list`" != "" ]; then
	echo "ignore"
	exit 0
fi


# 2 cases, when we need to mount the drive as r/w:
# - user drive, and /media/source already exists
# - target drive (obviously used mostly for writing)

if [ -h /media/source ] || [ "`echo $UUID |grep -ixFf /etc/planter/drives/target.list`" != "" ]; then
	OPTIONS="sync,nodev,noatime,nodiratime"
else
	OPTIONS="ro"
fi

mkdir -p $MOUNTPOINT
mount -t $FSTYPE -o $OPTIONS $DEVICE $MOUNTPOINT

if [ $? -ne 0 ]; then
	echo "error"
	exit 0
fi

echo "$DEVICE:$UUID" >>/run/planter.mounts


if [ "`echo $UUID |grep -ixFf /etc/planter/drives/target.list`" != "" ]; then
	echo "target"
	rm -f /media/target
	ln -s $MOUNTPOINT /media/target
elif [ "`echo $UUID |grep -ixFf /etc/planter/drives/source.list`" != "" ]; then
	echo "source"
	rm -f /media/source
	ln -s $MOUNTPOINT /media/source
fi
