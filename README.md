# minimap2_to_genome_identity
Simple script to compute genome identity from Minimap2 formatted PAF files

This is a simple Perl script for computing genome identity values between genomic assemblies of complete genomes. The program readsalignment files in paf format, as those produced by the means of the minimap2 aligner, and then produces a tab delineated 
file containing genome identity levels. The script is very simple. All the paf (*.paf) an genome assembly files (in fasta format)are required to be in the same folder from where the program is executed. Additionally genome assembly files are required to have the ".fna" suffix in order for the program to correctly identify/recognize them.
Paf files containing genomic alignments need to be named after the name of the genome assembly files that were compared. For example if you have <genome1.fsa> and <genome2.fsa>, you will needto save the alignments of these two genomes in a file called <genome1.fsa_genome2.fsa.paf>. Any symbol can be used to separate the name of the 2 files.
See https://github.com/lh3/minimap2 for a detailed reference to the paf format and how to install minimap.

The output file, which is in a simple tab delineated format, will contain the name of the genome files and the estimated identity levels. The name is hardcoded (Genome_ID.tsv), meaning that the file will be overwritten after every execution.
Multiple genomes can be compared, provided that the all the possible pairs of "pairwise" alignments betwen each pair of genomes have been computed. All the output files will need to be named according to the convention described above

Since the program is written in the Perl programming language, you will also need a Perl interpreter in order to run it. 
Perl is usually installed by default in unix alike systems. 
Anyway feel free to contact Matteo Chiara (matteo.chiara@unimi.it) if you encounter any problem or unexpected behaviour
