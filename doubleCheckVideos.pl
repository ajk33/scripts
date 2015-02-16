#!/usr/bin/perl
#
# This program was written to see if I could delete the Camcorder directory
# off of the 1TB portable drive
#

require "finddrive.pl";

use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

$drive = "s";
if ($#ARGV == 0) {
	$drive = $ARGV[0];
}

%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
@nummon = qw ( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

$srcdir = "/cygdrive/s/Camcorder/";
$dstdir = "/cygdrive/n/Camcorder/";

print "$srcdir -> $dstdir\n";

sub wanted {
    next if ( $name !~ /^.*\.MOD/i);
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
	    $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($File::Find::name);
    $fileList{$mtime} = $name;
    print ".";
}

sub process {
	my $mtime = @_[0];
	my $file = @_[1];
	my $linkname;
	($linkname = $file) =~ s/$srcdir/$dstdir/;
	($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$ssize,
        $atime,$smtime,$ctime,$blksize,$blocks) = stat($file);
	($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$dsize,
	$atime,$dmtime,$ctime,$blksize,$blocks) = stat($linkname);
	if ($ssize != $dsize) {
		print "Comparing $file to $linkname ...";
		print "Different sizes $ssize $dsize\n" 
	}
}

# Traverse desired filesystems
$|=1;
File::Find::find({wanted => \&wanted}, $srcdir);
$|=0;
foreach $time (sort { $a <=> $b } keys %fileList) {
	process($time,$fileList{$time});
}
exit;
