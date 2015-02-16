#!/usr/bin/perl
#

use Time::HiRes qw(gettimeofday);

$zeros="0000000000";
$i=0;
while ($i<20) {

  $t1=gettimeofday();
  $zeros=~/(0*)*A/;
  $delta=gettimeofday()-$t1;
  print "$zeros $result $delta\n";
  $zeros.=$zeros;
  $i++;
}
