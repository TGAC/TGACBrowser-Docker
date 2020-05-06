#!/bin/bash
count=0
sequencelevel="-sequence_level"

# Following block of code adds sequence information into Ensembl database
for f in $(ls /data/*.fa*);
do 
	((count++))
	coord=""
	if [[ $f == *"chr"* ]]; then
  		coord="chromosome"
	fi
	if [[ $f == *"scaffold"* ]]; then
  		coord="scaffold"
	fi
	if [[ $f == *"contig"* ]]; then
  		coord="contig"
	fi
	if [[ $f == *"clone"* ]]; then
  		coord="clone"
	fi
	perl /modules/ensembl-pipeline/scripts/load_seq_region.pl -dbhost db_serv -dbuser tgacbrowser -dbpass tgacbrowser -dbname tgac_browser_demo -coord_system_name $coord -rank $count -default_version $sequencelevel -fasta_file $f; 
	sequencelevel=""
done;

#This script can be extended to add more genomic features into Ensembl