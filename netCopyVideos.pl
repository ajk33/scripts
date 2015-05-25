#!/usr/bin/perl
#

require "finddrive.pl";
use Filesys::CygwinPaths ':all';
use POSIX qw(tzset);
use File::Copy;
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
	} elsif ($opt eq "-b") {
     $backward = 1;
	} else {
		$drive = $opt;
	}
}

# Only consider last 2 months
$twomonthsago = (int((time-60*86400)/86400))*86400;
print "$twomonthsago\n";

%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
@nummon = qw ( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

$srcdir = "/cygdrive/n/Camcorder";
$srcdir2 = "/cygdrive/n/HDCamcorder";
if ($portabledrive eq "") {
   print "Can't find the portable drive";
   exit;
}
$dstdir = $portabledrive."/Our\ Videos";
print "$srcdir -> $dstdir\n";

sub wanted {
    next if ( $name !~ /^.*\.MOD\z/s && $name !~ /^.*\.MP4\z/s && $name !~ /^.*\.MTS\z/);
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
	    $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($File::Find::name);
           #print "$mtime,$name\n";
    $fileList{$mtime} = $name;
}

sub process {
  my $mtime = @_[0];
  my $file = @_[1];
  ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($mtime); 
  $year+=1900;
  return if ($mtime < $twomonthsago && !$checkall);
  $smon = $mon+1;
  if ($smon < 10) { $smon = "0".$smon; }
  if ($mday < 10) { $mday = "0".$mday; }
  $ref = "$year/$mon/$mday";
  $serialnum{$ref}++;
  $snum = $serialnum{$ref};
  if ($snum < 10) { $snum = "0".$snum; }
  $monname = $nummon[$mon];
  ($suffix = $file) =~ s/.*(...)$/$1/;
  if ($suffix =~ /MOD/) {
    $suffix="mpg";
  }
  $linkname= "$dstdir/$year/${year}_$smon/${monname}_${mday}_$snum.$suffix";
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
    #while( system("cp \"$file\" \"$linkname\"")) { print " trying again..\n"; sleep 1;}
    copy($file,$linkname) or die "Can't copy $file to $linkname";
    print "copied\n";
  } else {
    print "Skipped\n"; 
    if ($suffix eq "MP4" && $file =~ /S108/) {
      $tvlinkname="$dstdir/$year/${year}_$smon/ForTV/${monname}_${mday}_$snum.$suffix";
      ($wintvlinkname=$tvlinkname)=~s#/cygdrive/(.)/(.*)#$1:\\$2#;
      $wintvlinkname=~s#/#\\#g;
      ($winfilename=$file)=~s#/cygdrive/(.)/(.*)#$1:\\$2#;
      $winfilename=~s#/#\\#g;
      mkdir "$dstdir/${year}/${year}_${smon}/ForTV";
      $command="/cygdrive/c/Program\\ Files\\ \\(x86\\)/VideoLAN/VLC/vlc -I dummy --dummy-quiet \"$winfilename\" --sout='#transcode{vcoded=VIDEO_CODEC,vb=8000,fps=29.97}:std{access=file,mux=ts,dst=\"$wintvlinkname\"}' vlc://quit";
      print "$command\n";
      system("$command");
    }
  }
  utime $mtime,$mtime, $linkname;
}

do {
  # Traverse desired filesystems
  File::Find::find({wanted => \&wanted}, $srcdir);
  File::Find::find({wanted => \&wanted}, $srcdir2);
  foreach $time (sort { $a <=> $b } keys %fileList) {
         process($time,$fileList{$time});
  }
  $twomonthsago-=(86400*30);
} while ($backward);
exit;
