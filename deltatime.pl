#!/usr/bin/perl
#
# Fixes the date for an individual file
#

use File::Find;
use Time::Local 'timelocal';

$oldtime=timelocal(0,54,12,20,2,103);
$newtime=timelocal(0,00,22,16,0,115);
$cutoff=timelocal(0,00,22,16,0,114);
$delta = $newtime-$oldtime;

$dir = "/cygdrive/f/DCIM/101MSDCF";

find(\&modtime,$dir);

sub modtime() {
  $file=$File::Find::name;
  ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks)=stat($file);
  ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime($mtime);
  print " $file $mon/$mday/$year $hour:$min:$sec\n";
  if ($mtime < $cutoff) {

    $newtime = $mtime + $delta;
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime($newtime);
    print "*$file $mon/$mday/$year $hour:$min:$sec\n";
    $files[0] = $file;
    utime $newtime,$newtime,@files;
  }
}
