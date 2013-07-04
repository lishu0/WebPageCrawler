#!/usr/bin/perl

#Auther:Shuo Li, University of Macau
#Date: 22/08/2012
#This is the step-1: get the url content from the internet with out any processing.
#

use utf8;
binmode(STDIN, ':encoding(utf8)');
binmode(STDOUT, ':encoding(utf8)');
binmode(STDERR, ':encoding(utf8)');

open DIC, "<:utf8", "dic-ch.txt" or die $!;     #choose the keyword form the a chinese-dictionary 
open PROXY, "<:utf8", "proxy-list.txt" or die $!;     #proxy agent list:you can get the dynamic list from this web:http://www.freeproxylists.net/zh/, you can modify the proxy-list.txt with its format
open URL, ">:utf8", "URL.htm" or die $!;     #the content which you get by this scrip in this file! This file is usefull for your next step!!!

use LWP::UserAgent;
use LWP::Simple;
use Encode;
$browser = LWP::UserAgent->new( );
$browser->env_proxy( ); # if we're behind a firewall
#$browser->proxy(['http'] => 'http://189.35.119.187:3128');#####
$count_page=0;
$count_proxy=0;
@store=<PROXY>;
$count_word=1;
$count_total_page=0;


while (<DIC>)
{
  s/\n$//g;      #delete the '\n' at the end of each line.
	print $_."No.:".$count_word.'IP:'.@store[$count_proxy]."\n";	
	$browser->proxy(['http'] => 'http://'.@store[$count_proxy]);
	my $url='http://59.77.21.82/cgi-bin/qq1.exe?&kw='.$_.'&subcorp=internet';    #this is the webpage you want to get, samely you can change with the format of keyword 
	my $response = $browser->get($url);
	sleep(30);     #prevent the IP blocking
	$count_page++;
	$count_total_page++;
	if ($response->is_success())
	{	
		if (count_total_page<200)
		{
		
			if ($count_page<15)
			{
				my $content=$response->content( );
				binmode(STDOUT, ":utf8");
				$con = decode("utf8", $response->content);
				$con = encode("unicode", $con);
				$content=$con;
				if ($content =~ /color=red/)
				{
					print URL $content;
					print $count_page."\n";
				}
					
			}
			else
			{
				sleep(150);
				$count_page = 0;
			}
			
		}
		else
		{
			$count_total_page=0;
			$count_proxy++;
			print "changeIP!\n"
		}
	}
	else
	{
		print "error!\n";
		$count_proxy++;
		print "changeIP!\n";
	}
	$count_word++;
} 
