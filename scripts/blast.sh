#!/bin/bash
#SBATCH -p debug  # Select Partition /  Queue
#SBATCH -c 2           # Number of cores needed
#SBATCH --mem 8192     # Memory Needed#SBATCH -t 0-00:12     # time (D-HH:MM) <E2><80><93> 12 minute job
#SBATCH -o /usr/users/ga002/tgacbrowser/%j.out    # STDOUT
#SBATCH -e /usr/users/ga002/tgacbrowser/%j.err    # STDERR

cd /usr/local/bin/scripts/
perl readBLASTparams.pl $1 $2 $3 $4 $5 > perlout.txt
