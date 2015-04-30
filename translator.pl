#!/usr/bin/perl
# If you're trying to use bash inside Perl.
use strict;
use warnings;

my $pipe;
open ($pipe, '|-', '/bin/sh') || die "FAileD: $!\n";
while (<DATA>) {
    print $pipe $_;
}
close $pipe;

# __DATA__, Bash stuff goes here.
__DATA__
echo "Hello World, This is Nicholas";

for i in 1 2 3 4; do
  printf "this is iteration %d of the loop\n" $i;
done;
