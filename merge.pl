#!/usr/bin/perl
use strict;

if (@ARGV < 2){
	print "Usage\n\tperl $0 <input1> <input2> >output\n";
	exit;
}

my $file = shift;
my %hash1;

open (IN, $file) || die $!;
<IN>;
while (<IN>){
	chomp;
	my @c = split /\t/, $_;
	$hash1{$c[2]} = \@c;
}
close IN;

my %hash2;
$file = shift;
open (IN, $file) || die $!;
while (<IN>){
	chomp;
	my @c = split /\t/, $_;
	$hash2{$c[0]} = \@c;
}
close IN;

foreach my $id (sort keys %hash1){
	my $cancertype = "Cancer of Unknown Primary";
	$cancertype = $hash2{$id}[4]  if ($hash2{$id}[4]);
	$cancertype = "Prostate Adenocarcinoma" if ($hash1{$id}[0] eq "prad_su2c_2019" || $hash1{$id}[0] eq "prad_su2c_2015");
	print "$id\t$hash1{$id}[0]\t$hash1{$id}[1]\t$hash1{$id}[6]\t$hash1{$id}[8]\t$cancertype\t$hash2{$id}[5]\t$hash2{$id}[6]\n";
}
