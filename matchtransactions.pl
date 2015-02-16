#!/usr/bin/perl
#

use Text::xSV;

$csv= new Text::xSV;

# This works with the file exported from Comnety bank.
$csv->open_file("</cygdrive/c/temp/bjsCreditCard.CSV");
$csv->read_header();

while ($csv->get_row()) {
  ($date,$category,$amount)=$csv->extract(qw(Date Category Amount));
  $amount=~s/\$//;
  $mult=-1.0; if ($category ne " Payment") { $mult=1.0; }
  if ($category eq "Credit Adjustment") {$mult=-1.0;}
  $amount=$mult*$amount;
  $trans{$amount}.=$date.",";
  print "$date $amount '$category' $mult $trans{$amount}\n";
}
close (F1);
  
print "************************************************************\n";
print "************************************************************\n";
print "************************************************************\n";
open(F2,"</cygdrive/c/temp/Akearns's\ Quicken\ Data.QIF");
while (<F2>) {
    if (/^D(\d+)\/(..)'(..)/) {
      $mon=$1; $day=$2; $year=$3;
      $mon="0000".$mon;
      $mon=~s/^.*?(..)$/\1/;
      $date="$mon/$day/20$year";
      $date=~tr/ /0/;
    }
    if (/^U(.*)/) {
      $amount=$1;
      $amount=~s/,//;
      $amount*=-1.0;
      print "$date $amount $trans{$amount}\n";
      if ($trans{$amount} =~ /$date,/) {
        $trans{$amount}=~s/$date,//;
      } else {
        $trans{$amount}.="*$date,";
      }
      $date="";
      $amount="";
    }
}
close (F2);


print "============================================================\n";
print "============================================================\n";
print "============================================================\n";
foreach $amount (sort keys %trans) {
  if ($trans{$amount} ne "") {
    print "$amount - $trans{$amount}\n";
  }
}
