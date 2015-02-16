#!/usr/bin/perl
#

require "finddrive.pl";
use POSIX qw(tzset);
use Digest::MD5;
$ENV{TZ} = 'EST+4';
tzset;

use File::Find ();
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

print "TZ=".$ENV{'TZ'}."\n";

%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
@nummon = qw ( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );

$srcdir1 = "/cygdrive/g/IMxLibrary/SDR-H200";
$srcdir2 = "/cygdrive/n/Camcorder";

sub wanted {
  print $name;
  if ( $name =~ /^.*\.MOD\z/s || $name =~ /^.*\.mpg\z/s) {
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
      $atime,$mtime,$ctime,$blksize,$blocks)
    = stat($File::Find::name);
#    $fileList{$mtime} = $name;
    process($name);
  }
}

sub process {
  my $file = @_[0];
  ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$ssize,
    $atime,$smtime,$ctime,$blksize,$blocks) = stat($file);

  open (my $fh, '<', $file) or die "Can't open '$file': $!";
  binmode ($fh);
  print Digest::MD5->new->addfile($fh)->hexdigest;
  print " $file ".scalar (localtime($mtime))."\n";
  close ($fh);

  utime $mtime,$mtime, $linkname;
}

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, $srcdir1);
#File::Find::find({wanted => \&wanted}, $srcdir2);
exit;
