#!/bin/bash
#
rsync -avP --delete --exclude=*RECYCLE.BIN --exclude=vnc-4_1_3-x86_win32.exe `./finddrive.pl -n`/ /cygdrive/u/NAS2
#rsync -avP --delete --exclude=vnc-4_1_3-x86_win32.exe /cygdrive/h/ /cygdrive/u/NAS2
sleep 10

