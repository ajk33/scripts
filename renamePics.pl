#!/usr/bin/perl
#
%monnum = qw ( Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12 );
$srcdir = "/cygdrive/c/Documents\ and\ Settings/akearns/My\ Documents/My\ Pictures/";
$dstdir = "/cygdrive/f/Our\ Pictures/";
open(DIR,"ls \"$dstdir\"|") or die "Cannot open dir";
while (<DIR>) {
    if (/(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (\d+)/) {
	chomp;
	$picdir=$_;
	$year = $2;
	$mon = $monnum{$1};
	print "$picdir => ${year}_$mon\n";
        print "mv \"$dstdir$picdir\" \"$dstdir${year}_$mon\"\n";
        system "mv \"$dstdir$picdir\" \"$dstdir${year}_$mon\"";
    }
}
