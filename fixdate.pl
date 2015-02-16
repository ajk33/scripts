#!/usr/bin/perl
#
# Fixes the date for an individual file
#

use Time::Local 'timelocal';

$file = "/cygdrive/g/IMxLibrary/SDR-H200/20121125/MOV001_8.mpg";

($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks)=stat($file);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime($mtime);

$year = 2012-1900;
$mon = 9-1;
$day = 11;

$atime = $mtime = timelocal($sec,$min,$hour,$day,$mon,$year);
$files[0] = $file;
utime $atime,$mtime,@files;
