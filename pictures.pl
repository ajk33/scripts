#!/usr/bin/perl

require "finddrive.pl";

use Getopt::Std;

use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;
use File::Copy;
use Image::ExifTool ':Public';

$count;
$lastcopytime=time;

%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
@nummon = qw ( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

$doall = 0;
getopts("an",\%opts);
if ($opts{"a"}) { 
    print "Will scan all pictures\n";
    $doall=1; 
}

$srcdir="$cameradrive/DCIM/";
print "$srcdir\n";
if (! -e $srcdir) {
  $cameradrive = $blackberry;
  $srcdir = "$blackberry/camera/";
  print "$srcdir\n";
}
$dstdir = "$portabledrive/Our\ Pictures";
$dst2dir = "$nas2drive/Our\ Pictures";

if ($portabledrive eq "") {
    print "Cannot find portable drive\n"; 
    &sync;
    exit;
}

if ($cameradrive eq "") {
    print "Cannot find camera drive\n"; 
    &sync;
    exit;
}

unless (-e $srcdir) {
    $srcdir="$cameradrive/home/user/camera";
    unless (-e $srcdir) {
        print "Cannot find pictures on $cameradrive\n";
    }
    &processdir($srcdir);
    $srcdir="$cameradrive/home/user/videos";
}

if ($ARGV[0] eq "-q") { exit; }

&processdir($srcdir);

if ($opts{"n"}) {
    system("./netCopyPictures.pl");
}

sub wanted {
    next unless (-f $name);
    next if ($name =~ m/.*\.THM/i); # Don't need these
    next if ($blackberry != "" && $name =~ m/.*\.MP4/i); # Don't need these
    print ".";
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
        $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($File::Find::name);
    $ftime = $mtime*10+$mtimes{$mtime}++;
    $fileList{$ftime} = $name;
#   print "$name $mtime\n";
    $count++;
}

sub genmonth {
    my $year = $_[0];
    my $mon = $_[1];
    $smon = $mon;
    if ($smon < 10) { $smon = "0".$smon; }
    return "${year}_$smon";
}

sub sync {
    if ($nas2drive eq "") {
        print "Cannot find second nas drive\n"; 
        exit;
    }
    $dstdir=~ s/ /\\ /g;
    $dstdir.="/";
    $dst2dir=~ s/ /\\ /g;
    print "Syncing pictures to NAS\n";
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($lastcopytime);
    ($sec,$min,$hour,$mday,$cmon,$cyear,$wday,$yday,$isdst) = localtime(time);
    $year+=1900;
    $cyear+=1900;
    $mon++;
    $cmon++;
    $eyear=$cyear;
    $emon=$cmon+1; if ($emon>12) { $emon=1; $eyear++;}
    do {
        $subdir=&genmonth($year,$mon);
        $command="mkdir -p $dst2dir/$year/$subdir";
        print $command."\n";
        system($command);
        $command="rsync -avP $dstdir$year/$subdir/ $dst2dir/$year/$subdir";
        print $command."\n";
        system($command);
        $mon++;
        if ($mon > 12) {
            $mon=1;
            $year++;
        }
    } until ($year==$eyear && $mon==$emon);
}

sub process {
    if ($skipcount > 10 && $doall == 0) { return; }
    my $mtime = @_[0];
    $mtime /= 10;
    $mtime = int($mtime);
    my $file = @_[1];
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($mtime);
    $lastcopytime=$mtime;
    $year+=1900;
    $mon+=1;
    $smon = $mon;
    if ($smon < 10) { $smon = "0".$smon; }
    if ($mday < 10) { $mday = "0".$mday; }
    $ref = "$year/$mon/$mday";
    $serialnum{$ref}++;
    $snum = $serialnum{$ref};
    if ($snum < 10) { $snum = "0".$snum; }
    $monname = $nummon[$mon];
    ($filename = $file) =~ s#/.*/(.*)#$1#;
    my $info = ImageInfo($file);
    ($camdir=$info->{"Model"}) =~s/ /-/g;
    if ($file =~ /1(..)D5100/) {
        $dirnum = $1;
        $filename =~ s/_/_$dirnum/;
    }
    $linkname= "$dstdir/$year/${year}_$smon/$camdir/$filename";
    mkdir "$dstdir";
    mkdir "$dstdir/${year}";
    mkdir "$dstdir/${year}/${year}_${smon}";
    mkdir "$dstdir/${year}/${year}_${smon}/$camdir";
    # Get file size
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$ssize,
    $atime,$smtime,$ctime,$blksize,$blocks) = stat($file);
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$dsize,
    $atime,$dmtime,$ctime,$blksize,$blocks) = stat($linkname);
    print "$file($ssize,$smtime)\n=>$linkname($dsize,$dmtime)\t";
    unless (-e $linkname && $dsize == $ssize && ($smtime > $dmtime-3601 && $smtime < $dmtime+3601)) {
#        symlink($file,$linkname);
        copy($file,$linkname) or die "Can't copy $file to $linkname";
        print "copied\n";
        $skipcount=0;
    } else {
        print "Skipped\n"; 
        $skipcount++;
        if ($skipcount > 10 && $doall == 0) {
            print "Skipping the rest.  Run with -a to look at all pictures.\n";
            $File::Find::prune = 1;
            return;
        }
    }
    utime $mtime,$mtime, $linkname;
}

sub processdir {
    $skipcount=0;
    my $srcdir = @_[0];
    $|=1;
# Traverse desired filesystems
    File::Find::find({wanted => \&wanted}, $srcdir);
    print "\t$count\n";
    foreach $time (sort { $b <=> $a } keys %fileList) {
    process($time,$fileList{$time});
#   process($dstdir,$time,$fileList{$time});
    }
}
print "Done copying from memory card.  You may remove it now.\n";
&sync;
exit;

