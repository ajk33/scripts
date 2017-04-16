#!/usr/bin/perl
#
#Fixes dates for the camcorder files that were not rsync'd
#
use 5.012; # so readdir assigns to $_ in a lone while test
use File::Find;
use Time::Local;


#my $dir = "/cygdrive/g/HDCamcorder";
my $dir = "/cygdrive/r/DCIM/101MSDCF";

my $incorrecttime = timelocal(0,40,17,20,1,107);
my $correcttime = timelocal(36,05,13,5,2,117);
find (\&modtime,$dir);

sub modtime() {
  (my $dev,my $ino,my $mode,my $nlink,my $uid,my $gid,my $rdev,my $size,
    my $atime,my $mtime,my $ctime,my $blksize,my $blocks) = stat($File::Find::name);
  
  if ($ctime < $incorrecttime) {
    print "$File::Find::name $ctime\t";
    my $delta = $ctime - $incorrecttime;
    my $newtime = $ctime - $incorrecttime + $correcttime;
    print "$delta\t$newtime\t";
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($newtime);
    $mon+=1; $year +=1900;
    print "$hour:$min:$sec $year/$mon/$mday\n";
    my @arr = ($File::Find::name);
    utime $newtime,$newtime, @arr;
  }
}

__DATA__
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
