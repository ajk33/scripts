#!/usr/bin/perl
#

require "finddrive.pl";
#use Filesys::CygwinPaths ':all';
use POSIX qw(tzset);
use File::Copy;
use Filesys::Df;

$ENV{TZ} = 'EST+4';
tzset;

use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

$srcdir = $hdcamcorderdrive;

sub getfreespace {
  return df($srcdir)->{per};
}

sub wanted {
    next if ( $name !~ /^.*\.JPG\z/s && $name !~ /^.*\.MP4\z/s);
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
	    $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($File::Find::name);
           #print "$mtime,$name\n";
    $fileList{$mtime} = $name;
}

sub process {
  return if (getfreespace() < 50);
  my $mtime = @_[0];
  my $file = @_[1];
  ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($mtime); 
  unlink($file);
  print "$file ".getfreespace()."%\n";
}

do {
  # Traverse desired filesystems
  File::Find::find({wanted => \&wanted}, $srcdir);
  foreach $time (sort { $a <=> $b } keys %fileList) {
         process($time,$fileList{$time});
  }
} 
