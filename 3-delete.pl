#!/usr/bin/perl

#Auther: Shuo Li, University of Macau
#Date: 22/08/2012
#This is the step-3: Put the *.txt file under this directory, this script will seperate *.txt with two kind language into two different files. To get a parallel corpus. 
#

use LWP::Simple;
use strict;
use warnings;
open E, "<:utf8", "e.txt" or die $!;
open C, "<:utf8", "c.txt" or die $!;
open TEST,">:utf8", "test.txt" or die $!;

#We take English-Chinese as the Example
#使用前请将英文语料库中的某些标点符号前的空格去掉 以便统一！例如：\s,->,  \s.->.
#Before using this script, please check some punctuations and error blanks. Delete these like: \s, into ,  and \s.into.

###############write two files into one new fiel#############################

$a=0;
my @store=<C>;
while (<E>) {
  s/\n$/@@@@@/g;          #replace/n to mark"||"
  print TEST $_;
  print TEST $store[$a];
  $a++;
}
close(E);
close(C);
close(TEST);

##############################################################################
#######################delete duplicate records###############################
open TEST,"<:utf8", "test.txt" or die $!;
open TEST_OUT,">:utf8", "test_out.txt" or die $!;
my %hash;
while (<TEST>) {
    if (!$hash{$_}) {
        print TEST_OUT;
      $hash{$_} += 1;
    }
}
close(TEST_OUT);
close(TEST);
################################################################################

open TEST_OUT,"<:utf8", "test_out.txt" or die $!;
open E_OUTPUT,">:utf8", "final_e.txt" or die $!;     #The final corpus of English
open C_OUTPUT,">:utf8", "final_c.txt" or die $!;     #The final corpus of Chinese
while (<TEST_OUT>)
{
  if (/(^.+)@@@@@(.*)/)
	{
		print E_OUTPUT $1."\n";
		print C_OUTPUT $2."\n";
	}
}
close(TEST_OUT);
close(E_OUTPUT);
close(C_OUTPUT);

unlink("test.txt");
unlink("test_out.txt");
