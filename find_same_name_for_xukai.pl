#!/usr/bin/perl -w
## lina 2012.6.15

my $file_dataset = shift @ARGV;
my $file_search = shift @ARGV;
my $output = shift @ARGV;
my $left_name = shift @ARGV;

open DATASET, "<$file_dataset";
open SEARCH, "<$file_search";
open OUT, ">$output";
open LEFT, ">$left_name";

print OUT "The common gene name are: \n";
print LEFT "The left gene name are: \n";

my @dataset;
for my $data (<DATASET>){
	push @dataset, $data;
}

for my $name (<SEARCH>){
	my $flag=0;
	for my $name_set (@dataset){
		if ($name eq $name_set){
			print OUT $name;
			$flag =1;
			last;
		}
	}
	if ($flag==0){
		print LEFT $name;
	}
}

close OUT;
close LEFT;
