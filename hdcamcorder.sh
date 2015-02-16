#!/bin/bash
#
drive=`./finddrive.pl -d`
echo "Reading from drive $drive"
rsync -avP --exclude="*.MOI" $drive/DCIM/ /cygdrive/n/HDCamcorder/
rsync -avP --include="*.MTS" $drive/PRIVATE/AVCHD/BDMV/STREAM /cygdrive/n/HDCamcorder/
