#!/usr/bin/perl
use strict;
use warnings;
use Term::ANSIColor qw(:constants);
use Data::Printer;
 
$| = 1; # turn off the buffering of STDOUT
 
my ($choice, $times, $key, $value, @hash);
my @array = 0..9;
 
for my $i (@array) {
	push @hash, { map { $_ => $_ * $i } @array};
}
 
# Ask the user and store the response, then chomp it
print "What times tables would you like to see? ";
$choice = <STDIN>;
chomp($choice);
$times = $hash[$choice];
 
# My way of doing it.
# This was made possible by %hash ref. :)
print "\nTimes Tables (First loop, unsorted): $choice \n";
# LOOP THROUGH IT, unsorted
while (($key, $value) = each($times)){
     print $key.": ".$times->{"$key"}," \n";
}
 
print "\nTimes Tables (Second loop, sorted): $choice \n";
print "{\n";
# FOR LOOP, sorted
for $key (sort keys $times) {
	#print $key;
	if ( $key == keys($times) ) {
		print 
		YELLOW, "\t$key\: ", RESET, 
		CYAN, " \t${ $times }{$key}\n", RESET;
	} else { 
		print 
		YELLOW, "\t$key\: ", RESET, 
		CYAN, " \t${ $times }{$key}", RESET, 
		WHITE, "\,\n", RESET;
	}
}
print "}\n";
 
#################################################
# Data Dumper's way of doing it. 
# This is what I'm trying to achieve.
#################################################
print "\nTimes Tables (Data\:\:Dumper)\: $choice\n";
p $times;
