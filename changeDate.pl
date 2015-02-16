#!/usr/bin/perl
#
# Fixes the date for an individual file
#

$checkall=0;
&getargs();
require "finddrive.pl";
use Time::Local 'timelocal';
use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;
use Term::ReadLine;
my $term = Term::ReadLine->new('Simple Perl calc');
my $count=0;

$srcdir = $helidrive."/VIDEO/RECORD";
#$srcdir = "/cygdrive/d/Heli/Video";
print "Searching $srcdir\n";

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, $srcdir);
foreach $time (sort { $a <=> $b } keys %fileList) {
       process($time,$fileList{$time});
}
exit;

sub wanted {
  next if ( $name !~ /^.*\.avi\z/si);
  ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
    $atime,$mtime,$ctime,$blksize,$blocks)
  = stat($File::Find::name);
  if ($mtime > timelocal(1,1,1,1,1,2018-1900) || $checkall == 1) {
    my $prompt = "$name\nEnter new Date (mm/dd/yyyy) ";
    my $OUT = $term->OUT || \*STDOUT;
    $_ = $term->readline($prompt);
    my $res = eval($_);
    warn $@ if $@;
    $term->addhistory($_) if /\S/;
    /(\d+)\/(\d+)\/(\d+)/;
    $mon=$1-1;
    $newtime = timelocal(0,$count++,0,$2,$mon,$3);
    $listoffiles[0] = $name;
    utime $newtime,$newtime,@listoffiles;
  }
}

sub getargs() {
  while (@ARGV) {
    $opt = pop @ARGV;
    if ($opt eq "-a") {
      $checkall = 1;
    }
  }
}

__DATA__
($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks)=stat($file);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime($mtime);

$year = 2012-1900;
$mon = 9-1;
$day = 11;

$atime = $mtime = timelocal($sec,$min,$hour,$day,$mon,$year);
$files[0] = $file;
utime $atime,$mtime,@files;

use POSIX qw(tzset);
$ENV{TZ} = 'EST+4';
tzset;

use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

print "TZ=".$ENV{'TZ'}."\n";
$drive = "s";
my $checkall=0;
while (@ARGV) {
$opt = pop @ARGV;
if ($opt eq "-a") {
$checkall = 1;
} else {
$drive = $opt;
}
}

%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
@nummon = qw ( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

$srcdir = "/cygdrive/g/IMxLibrary/SDR-H200";
$srcdir = "/cygdrive/n/Camcorder";
$dstdir = $portabledrive."/Our\ Videos";
print "$srcdir -> $dstdir\n";


sub process {
my $mtime = @_[0];
my $file = @_[1];
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($mtime); 
$year+=1900;
# Only consider last 2 months
$twomonthsago = (int((time-60*24*60*60)/86400))*86400;
return if ($mtime < $twomonthsago && !$checkall);
$smon = $mon+1;
if ($smon < 10) { $smon = "0".$smon; }
if ($mday < 10) { $mday = "0".$mday; }
$ref = "$year/$mon/$mday";
$serialnum{$ref}++;
$snum = $serialnum{$ref};
if ($snum < 10) { $snum = "0".$snum; }
$monname = $nummon[$mon];
$linkname= "$dstdir/$year/${year}_$smon/${monname}_${mday}_$snum.mpg";
mkdir "$dstdir";
mkdir "$dstdir/${year}";
mkdir "$dstdir/${year}/${year}_${smon}";
# Get file size
($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$ssize,
$atime,$smtime,$ctime,$blksize,$blocks) = stat($file);
($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$dsize,
$atime,$dmtime,$ctime,$blksize,$blocks) = stat($linkname);
print "$file($ssize,$smtime) ".scalar (localtime($mtime))."\n=>$linkname($dsize,$dmtime)\t";
unless (-e $linkname && $dsize == $ssize && ($smtime > $dmtime-3700 && $smtime < $dmtime+3700)) {
#        symlink($file,$linkname);
while( system("cp \"$file\" \"$linkname\"")) { print " trying again..\n"; sleep 1;}
print "copied\n";
} else {
print "Skipped\n"; 
}
utime $mtime,$mtime, $linkname;
}
