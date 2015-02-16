#!/usr/bin/perl
#

use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
@nummon = qw ( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

#$srcdir = "/cygdrive/f/IMxLibrary/SDR-H200";
#$srcdir = "/cygdrive/c/Documents\ and\ Settings/akearns/My\ Documents/IMxLibrary/SDR-H200";
$srcdir = "/cygdrive/g/IMxLibrary/SDR-H200";
$dstdir = "/cygdrive/f/Our\ Videos";

sub wanted {
    next if ( $name !~ /^.*\.mpg\z/s);
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
	    $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($File::Find::name);
    $fileList{$mtime} = $name;
}

sub process {
	my $mtime = @_[0];
	my $file = @_[1];
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($mtime);
    $year+=1900;
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
    print "$file($ssize,$smtime)\n=>$linkname($dsize,$dmtime)\t";
    unless (-e $linkname && $dsize == $ssize && ($smtime > $dmtime-3700 && $smtime < $dmtime+3700)) {
#        symlink($file,$linkname);
        system("cp \"$file\" \"$linkname\"");
	print "copied\n";
    } else {
	print "Skipped\n"; 
    }
    utime $mtime,$mtime, $linkname;
}

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, $srcdir);
foreach $time (sort { $a <=> $b } keys %fileList) {
       process($time,$fileList{$time});
}
exit;
