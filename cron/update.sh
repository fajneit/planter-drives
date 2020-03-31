#!/bin/sh

# if you want to fork this repository and use it with
# your own drives, this is the exact url to replace
URL="https://update.fajne.it/drives"


update_file() {
	file=/etc/planter/drives/$1
	curl -sS $URL/$1 >$file.new
	if grep -q generated $file.new; then
		mv -f $file.new $file
	fi
}

mkdir -p /etc/planter/drives
update_file target.list
update_file ignore.list
update_file source.list
