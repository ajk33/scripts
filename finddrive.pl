#!/usr/bin/perl
#

use File::Basename;
my @cameradrive= glob( "/cygdrive/*/MEMSTICK.IND" );
my @camcorderdrive= glob( "/cygdrive/*/CAMCNINF.DAT" );
my @hdcamcorderdrive= glob( "/cygdrive/*/CAMCORDER.HD" );
my @portabledrive= glob( "/cygdrive/*/TBHD.INF" );
my @gpsdrive= glob( "/cygdrive/*/nuvi_drive.ico" );
my @nasdrive= glob( "/cygdrive/*/NAS2.inf" );
my @nas2drive= glob( "/cygdrive/*/NAS2.INF" );
my @helidrive= glob( "/cygdrive/*/HELI.inf" );
my @backupdrive= glob( "/cygdrive/*/BACKUP.inf" );
my @blackberry= glob( "/cygdrive/*/system_crypt_file" );

$cameradrive = dirname($cameradrive[0]) if (exists $cameradrive[0]);
$camcorderdrive = dirname($camcorderdrive[0]) if (exists $camcorderdrive[0]);
$hdcamcorderdrive = dirname($hdcamcorderdrive[0]) if (exists $hdcamcorderdrive[0]);
$portabledrive = dirname($portabledrive[0]) if (exists $portabledrive[0]);
$gpsdrive = dirname($gpsdrive[0]) if (exists $gpsdrive[0]);
$nasdrive = dirname($nasdrive[0]) if (exists $nasdrive[0]);
$nas2drive = dirname($nas2drive[0]) if (exists $nas2drive[0]);
$helidrive = dirname($helidrive[0]) if (exists $helidrive[0]);
$backupdrive = dirname($backupdrive[0]) if (exists $backupdrive[0]);
$blackberry = dirname($blackberry[0]) if (exists $blackberry[0]);

print "$cameradrive" if ($ARGV[0] eq "-c");
print "$camcorderdrive" if ($ARGV[0] eq "-v");
print "$hdcamcorderdrive" if ($ARGV[0] eq "-d");
print "$portabledrive" if ($ARGV[0] eq "-p");
print "$gpsdrive" if ($ARGV[0] eq "-g");
print "$nasdrive" if ($ARGV[0] eq "-n");
print "$nas2drive" if ($ARGV[0] eq "-2");
print "$helidrive" if ($ARGV[0] eq "-h");
print "$backupdrive" if ($ARGV[0] eq "-b");
print "$blackberry" if ($ARGV[0] eq "-s");  # for smartphone

1;
