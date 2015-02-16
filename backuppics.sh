#!/bin/bash
#
nas=`perl finddrive.pl -n`
drive=`perl finddrive.pl -b`
echo "NAS drive" $nas
echo "Backup drive" $drive
echo "Writing to drive $drive"
rsync -avP $nas/Our\ Pictures $drive/
sleep 10

