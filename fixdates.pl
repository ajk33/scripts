#!/usr/bin/perl
#
#Fixes dates for the camcorder files that were not rsync'd
#

use File::Find;

$dir = "/cygdrive/n/camcorder";

find (\&modtime,$dir);

sub modtime() {
     if (/.PGI/) { 
	 ($dirtofix=$File::Find::name) =~ s/(.*)\/PRG.*/$1/;
	 print "$File::Find::name -> $dirtofix\n"; 
         ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
          $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($File::Find::name);
	 $files[0] = $dirtofix;
	 utime $atime,$mtime,@files;
     }
}
