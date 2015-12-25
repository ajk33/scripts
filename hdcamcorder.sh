#!/bin/bash
#
drive=`./finddrive.pl -d`
echo "Reading from drive $drive"
rsync -avP --exclude="*.MOI" $drive/DCIM/ /cygdrive/g/HDCamcorder/
rsync -avP --include="*.MTS" $drive/PRIVATE/AVCHD/BDMV/STREAM /cygdrive/g/HDCamcorder/
./cleanhdcamcorder.pl
