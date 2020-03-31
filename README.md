# Overview

`planter-drives` is a simple framework for recognizing and classifying drives/partitions based on their UUID.

It distinguishes 5 types of partitions:

- source
- target (destination for file copy operations)
- fallback target (in case current target doesn't meet requirements)
- ignored (not used)
- user (all others)

Target partition has to be writable and to have created one of 3 directory schemes:

- `.support/.files`
- `.files/.data`
- `files/data`

If neither of them are present, or target partition is not mounted at all, `/media/fallback` directory is used instead (no matter, on which filesystem it is created).

# Drive detection

`planter-drives` classifies drives using UUIDs of logical partitions. These serial numbers are checked against 3 configuration files on each add/remove event:

- `/etc/planter/drives/ignore.list`
- `/etc/planter/drives/target.list`
- `/etc/planter/drives/source.list`

These files are updated every 30 minutes, if network is working (you can edit crontab entry after setup eg. to update them less frequently).

## Events

`planter-drives` doesn't detect plugging or unplugging devices on its own. It just exposes scripts, that should be executed on each add/remove event.

# Installing

- clone this repository to chosen directory
- run `setup.sh` script as root

# License

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Tomasz Klim (<opensource@tomaszklim.pl>) |
| **Copyright:**       | Copyright 2017-2020 Tomasz Klim          |
| **License:**         | MIT                                      |

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
