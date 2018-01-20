#!/usr/bin/perl -w

############################
#
#	IOfileExporter
#	Author: Robert Thompson
#
############################
#
#	Description & Usage:	Asks for an input file name and an output file name, takes the contents, performs a string substitution
#				on the contents of the in-file and prints it to the out-file. Script can be manipulated with the right
#				conditions to conduct this substitution on almost any data.
#
############################


$spacer = "=====================================================================================\n";	### Variable use to organize output.

print "Full path of passwd file: ";
$pwFile = <STDIN>;			### Takes user input for in-file
chomp $pwFile;				### and formats it for usage.

$oDir = "/tmp/rthompson";	### Setting output file-location. Can be changed as needed.

print "Name of OUTPUT file: ";
$oVar = <STDIN>;			### Takes user input for out-file
chomp $oVar;				### and formats it for usage.
$oFile = "$oVar.txt";		### Appending ".txt" to the end. Can be changed as needed.

print "$spacer";

if (-e $oDir && -d $oDir) {			### Output Directory existence check.
	print "[+] Directory exists.\n";
} else {
	print "[-] Directory does not exist. Creating directory.\n";
	mkdir $oDir;				### Directory creation if non-existent.
}


if (-e $pwFile && -r $pwFile) {
	print "[+] Filecheck succeeded.\n";	### in-file existence check.
} else {
	print "[-] Filecheck failed: $pwFile does not exist. Check path and try again.\n";
	exit;					### Kills script if file-check fails.
}

print "$spacer";
print "Press <Enter> to continue.";
<>;

open(FH1,"< $pwFile");
while(<FH1>) {
	push (@fileContents, $_);
	chomp $_;
	$homeUsers = "home";		### Variable used with grep. Can be changed as needed.

	@match = grep {/$homeUsers/}@fileContents;	### @match array contains the grep'd output of the @fileContents array
}							### searching for only lines containing "home."

print "$spacer\t\t\t\t++ Matched Users ++\n\n";
foreach $i (@match) {
	print "$i";			### Output reviewal before exporting.
}
print "\n$spacer\n";

s/\/home/\/export\/home/ for @match;	### Substitution operation. Can be changed as needed.
					### For items within @match array, search for "/home" and replace with "/export/home".
print "Ready to export to file. Path: $oDir/$oFile.\nWARNING: If your desired output file exists, CONTENT WILL BE OVERWRITTEN!\n\nPress <Enter> to continue.";
<>;					### Waits for user interaction; allows for reviewal of output (See above).
close(FH1);			### Closing of first File Handler.
open(FH2, ">", "$oDir/$oFile");		### NOTE: SINGULAR ">" DOES NOT APPEND; THIS WILL OVERWRITE CONTENTS OF $oFile IF IT EXISTS. USE CAREFULLY.
foreach $j (@match) {
#	print $j;		### Debugging line. Uncomment to have STDOUT display content being printed to file.
	print FH2 $j;	### Printing contents of FH2 into $j
}


close(FH2);			### Closing of second File Handler.

exit;
