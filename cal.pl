#!/usr/bin/perl;
use strict;

if (@ARGV < 1){
	print "Usage\n\tperl $0 <input.table> >output\n";
	exit;
}

my $file = shift;
my %hash;

open (IN, $file) || die $!;
while (<IN>){
	chomp;
	my @c = split /\t/, $_;
	$hash{$c[5]}{total} ++;
	if ($c[3] eq "AMP" && $c[4] ne "AMP"){
		$hash{$c[5]}{MDM2} ++;
	}elsif ($c[3] ne "AMP" && $c[4] eq "AMP"){
		$hash{$c[5]}{MDM4} ++;
	}elsif ($c[3] eq "AMP" && $c[4] eq "AMP"){
		$hash{$c[5]}{both} ++;
	}else{
		$hash{$c[5]}{neither} ++;
	}
}

foreach my $cancer (sort keys %hash){
	my ($total, $mdm2, $mdm4, $both, $neither) = (0,0,0,0,0);
	$mdm2 = $hash{$cancer}{MDM2} if ($hash{$cancer}{MDM2});
	$mdm4 = $hash{$cancer}{MDM4} if ($hash{$cancer}{MDM4});
	$both = $hash{$cancer}{both} if ($hash{$cancer}{both});
	$neither = $hash{$cancer}{neither} if ($hash{$cancer}{neither});
	print "$cancer\t$hash{$cancer}{total}\t$mdm2\t$mdm4\t$both\t$neither\n";
}
