WebPageCrawler
==============

Here are some PERL script tools for you to build a small size parallel corpus from the Internet. This is the first version, it cannot be guarnteed that it works well on every websites, because different website has different format and regularity. (http://www.superfection.com/ and http://www.jukuu.com/ have been tested) You can apply these tools directly on the two websites above.
* Before using it, you need a environment to run the PERL
* Check your computer, if you do not have PERL, you can download: http://www.perl.org/get.html 
* In Windows, the text editor I recommand you to use the Notepad++: http://notepad-plus-plus.org/download/
http://www.gossland.com/course/intro/running.html
http://alumnus.caltech.edu/~svhwan/prodScript/invokingPerl.html (For your reference to run a Perl script)
There are 3 steps:
STEP 1: Run the 1-geturl.pl to crawl the content of the webpage.
    The dictionary and proxy agent will be used. You can edit the "dic-ch.txt" and "proxy-list.txt" with the correct format by youself.     After this step, you will get a URL.htm file with the content crawled from the web. 

STEP 2: Under the directory ~/2-html2txt/ use the tool "Html2Txt.exe" to get the necessary text of the corpus.
    This tool is collectd from the internet. It is efficient to convert the HTML content to the text.

STEP 3: Under the directory ~/3-deletion/ use the "3-delete.pl" to filter out unnecessary markups and seperate the binlingual corpus into two files. 
    It realizes the aim of building the parallel corpus.     Be careful that different website has different format to apply the regular expression rule. It need to modified when dealing another website.
*Because most of these files are written in PERL and it is very easy for you to use with the comments. When using this, becareful about your encoding. utf-8 is better.
