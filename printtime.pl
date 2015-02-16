#!/usr/bin/perl

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($ARGV[0]);
print ("$sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst\n");
