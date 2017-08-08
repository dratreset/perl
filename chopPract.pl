#!/usr/bin/perl -w

######################################
#
#	Choping Strings
#	Author: Rob Thompson
#	
#	Usage:	Using the command stated above this comment block, enter a string.
#
######################################
#
#	This script is meant for assignment "Project 3.1"
#
######################################


print "Enter an 8 character string: ";
$strng = <STDIN>;	### This line takes user input from the command line.

for (my $i=1; $i <=8; $i++) {	### for-loop interating over a variable created within the loop's syntax
	chop ($strng);		### which will conduct the given command until the condition ($i <= 8) is
	print "$strng\n";	### met. Adds 1 to the counter after each iteration.
}
