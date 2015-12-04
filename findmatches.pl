#!/usr/bin/perl
#

my %hashmap;
my @rmlist;

open(FILE,"</cygdrive/g/digest1.txt");
readfile();
close(FILE);
open(FILE,"</cygdrive/g/digest2.txt");
readfile();
close(FILE);

$totsize=0;
foreach $hash (sort keys %hashmap) {
    $filenames=$hashmap{$hash};
    $output="$hash$hashmap{$hash}";
    @files=split(/,/ ,$output);
    $numfiles=@files;
#    print "$output $numfiles\n";
    $lastdate=0;
    while ($output =~ m#/(20\d+)/#g)  {
       $date=$1;
       if ($date != $lastdate && $lastdate != 0) {
         #print "Date Mismatch $lastdate $date\n";
       }
       $lastdate=$date;
    }
    if ($numfiles == 3) {
        ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
            $atime,$mtime,$ctime,$blksize,$blocks)
               = stat("/cygdrive/g/".$files[2]);
        $totsize += $size;
        push(@rmlist,"\"$files[2]\"   # ".$files[1]." $size");
    }
}

print "#!/bin/bash\n\n";
foreach $file (sort @rmlist) {
  print "rm $file\n";
}
print "# Saved $totsize bytes\n";
sub readfile() {
  while (<FILE>) {
    chomp;
    ($hash,$filename)=/(.*?) .(.*)/;
    $hashmap{$hash}.=",".$filename;
  }
}
