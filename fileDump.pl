#/usr/bin/perl -w

#############################
#
#	Simple program to dump the contents of a text file to the screen, line by line.
#	Author: Robert Thompson
#
#	Usage:	running the script using the perl -w command, script will prompt the user for a file. 
#		Simply enter a file name (an example file is located in the directory of this script)
#		and hit enter.
#
#############################
#
#	Full disclosure: I wrote a script eerily similar to this in week 7
#	based on the video lecture from that week in order to acclimate to
#	perl. A lot of this code is recycled from that script.
#
#############################

### Modules

use strict;
use warnings;


### Variables

print 'Enter a file name to open:';	### Requests filename from user.
chomp(my $fileName = <STDIN>);		### Cuts newline character, loads STDIN into variable.


### Main Code

if (-e $fileName) {			### Validates input.
	print "File exists.\n";
	open(FH, "< $fileName") or die "Can't open file. Error is: $1";		### FH = FileHandler, the $fileName variable is loaded into
	my @fileContents;							### the file handler
	while (<FH>) {				### while FH is open...
		push (@fileContents, $_);	### push in FH ($_) into
	}					### the array (@fileContents)
	foreach my $i (<@fileContents>) {
	print "$i\n";				##### For each of my $i in @fileContents, print $i to the screen.
	}
} else {
	print "File does NOT exist.\n";	### Error catch.
}
