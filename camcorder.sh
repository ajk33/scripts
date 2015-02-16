#!/bin/bash
#
drive=`./finddrive.pl -v`
echo "Reading from drive $drive"
rsync -avP --exclude-from=excludelist --exclude="*.MOI" $drive/SD_VIDEO/ /cygdrive/n/Camcorder/
