#!/usr/bin/perl
use strict;

if (@ARGV < 1){
	print "Usage\n\tperl $0 <input.1> >output\n";
	exit;
}

my $file = shift;
my @array;

open (IN, $file) || die $!;
while (<IN>){
	chomp;
	my @c = split /\t/, $_;
	push @array, \@c;
}
close IN;

for (my $i=0; $i < @{$array[0]}; $i++){
	for (my $j=0; $j < @array; $j++){
		print "$array[$j][$i]\t";
	}
	print "\n";
}
