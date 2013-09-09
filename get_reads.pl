#!usr/bin/perl
# by lina 2013.07.16
# usage: >perl get_reads.pl input name_list output
use strict;
use Bio::SeqIO;

my $use="This program is used to get read from its display_id.\nUsage:\n      perl get_reads.pl input name_list output\n";
my $input=shift or die $use;
my $list=shift or die $use;
my $output=shift or die $use;

my $in = Bio::SeqIO ->new (-file => $input, -format => "fasta");
my $out = Bio::SeqIO ->new (-file => ">$output", -format => "fasta");

open(LIST,$list)or die "cannot open the file: $list\n";
my @name=<LIST>;

while (my $seq = $in ->next_seq() ){
	my $id = $seq ->display_id;
	my $seq_content=$seq ->seq;

	for my $name (@name){
		chomp $name;

		if ($id eq $name){
			my $seq_obj = Bio::Seq ->new (
  	    	                             -seq => $seq_content,
   	                        	     -display_id => $id,
   	  	                             );
		        $out -> write_seq($seq_obj);
			last;
		}
	}

}
close LIST;
