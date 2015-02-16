#!/usr/bin/perl
#

my %hashmap;
$drive1="/cygdrive/n";
$drive2="/cygdrive/g";

open(FILE,"<$drive1/digest.txt");
readfile();
close(FILE);
open(FILE,"<$drive2/digest.txt");
readfile();
close(FILE);

foreach $key (sort keys %hashmap) {
  print "$key $hashmap{$key}\n";
}

sub readfile() {
  while (<FILE>) {
    chomp;
    ($filename,$hash)=/SHA1\((.*?)\)= (.*)/;
    $hashmap{$hash}.=$filename.",";
  }
}
