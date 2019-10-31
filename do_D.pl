#ALL paf ffiles
@files=<*.paf>;
#fasta di tutti i genomi
@genomes=<*.fna>;
open(OUT,">Genome_ID.tsv")


foreach $f (@files)
{
	$g1="";
	$g2="";
	foreach $gen (@gen)
	{
		next if $gen eq $g1;
		$g1=$gen if $f=~/$gen/ && $g1 eq "";
		$g2=$gen if $f=~/$gen/;
	}
	die("could not determine the name of the first genome\n") if $g1 eq "";
	die("could not determine the name of the second genome\n") if $g2 eq "";
	open(IN,$f);
	@IDS=();
	@LNS=();
	$TOT=0;
	while(<IN>)
	{
		($l,$id)=(split())[10,-1];
		$id=(split(/\:/,$id))[-1];
		$id=100-100*$id;
		next if $l<=1000;
		$TOT+=$l;
		push(@IDS,$id);
		push(@LNS,$l);		
	}
	$ID=0;
	for ($i=0;$i<=$#IDS;$i++)
	{
		$ID+=$IDS[$i]*$LNS[$i]/$TOT;
	}
	$sim_Data{$g1}{$g2}=$ID;
	$sim_Data{$g2}{$g1}=$ID;
}
@genomes=sort(keys %sim_Data);
print OUT " @genomes\n";
	
foreach $g1 (@genomes)
{
	print OUT "$g1 ";
	foreach $g2 (@genomes)
	{
		$id = $g1 eq $g2 ? 100 : $sim_Data{$g1}{$g2};
		print OUT "$id ";
	}
	print OUT "\n";
}
