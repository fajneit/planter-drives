#!/bin/sh

dir=`dirname $0`
if [ "$dir" = "." ]; then dir=`pwd`; fi
if [ "$dir" = ".." ]; then
	echo "run this script from its directory"
	exit 1
fi

$dir/cron/update.sh

if ! grep -q $dir/cron/update.sh /etc/crontab; then
	echo "setting up crontab entry for $dir/cron/update.sh"
	echo "*/30 * * * * root $dir/cron/update.sh" >>/etc/crontab
fi
