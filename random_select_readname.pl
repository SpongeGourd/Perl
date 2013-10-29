#!/usr/bin/perl -w
## lina 2013.10.29

my $namelist = shift @ARGV;
my $output = shift @ARGV;

open LIST, "<$namelist";
open OUT, ">$output";

my @randNum = createRandNum(1313945,1572);
my %line_name;
my $n=1;

while (<LIST>){
	chomp;
	$line_name{$n}=$_;
	$n++;
}

my $name_selected;
foreach (@randNum){
	$name_selected = $line_name{$_};
	print $_."\t".$name_selected."\n";
	print OUT $name_selected."\n";
}

sub createRandNum
{
	my ($MaxNum,$MaxCount) = @_;
	my $i = 0;
	my %rand = ();

	while (1){
		$no = int(rand($MaxNum));
		if (!$rand{$no}){
			$rand{$no} = 1;
			$i++;
		}
		last if ($i >= $MaxCount);
	}
	my @randnum = keys % rand;
	return @randnum;
}
