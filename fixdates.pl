#!/usr/bin/perl
#
#Fixes dates for the camcorder files that were not rsync'd
#
use 5.012; # so readdir assigns to $_ in a lone while test
use File::Find;

my $dir = "/cygdrive/g/HDCamcorder";

find (\&modtime,$dir);

sub modtime() {
  my $dirtofix = $File::Find::name;
  if (! -d $dirtofix) {
    return;
  }
  opendir(my $dh,$dirtofix) || die "Cannot open $dirtofix";
  print "Scanning $dirtofix for MP4 Files\n";
  my @files = readdir($dh);
  close($dh);
  my $file;
  my $usefile = "";
  foreach $file (@files) {
    if ($usefile eq "" && $file =~ /.*(MP4|JPG)/) {
      $usefile = $file;
    }
  }
  $usefile = "$dirtofix/$usefile";
  print "$usefile\n";
  if (-e $usefile) {
    print "Setting $dirtofix time to time of $usefile\n";
    (my $dev,my $ino,my $mode,my $nlink,my $uid,my $gid,my $rdev,my $size,
      my $atime,my $mtime,my $ctime,my $blksize,my $blocks)
    = stat($usefile);
    my @files;
    $files[0] = $dirtofix;
    print "Setting $dirtofix to time $mtime\n";
    utime $atime,$mtime,@files;
  } else {
    print "Cannot fix $dirtofix: no MP4 Files\n";
  }
}
