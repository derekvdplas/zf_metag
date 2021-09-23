#!/bin/bash

#SBATCH --job-name=out_dada2
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
####SBATCH --mail-user="derekvanderplas@hotmail.com"
#SBATCH --mail-type="ALL"

#SBATCH --partition="testing"
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --mem=1000M


module load R/3.6.2-foss-2019b


cd R

Rscript 00prep_dada2.R
echo 'end of script 00'

Rscript 01SI_merge_dada2.R
echo 'end of script 01'

Rscript 02construct_seq_table.R
echo 'end of script 02'

Rscript 03assign_tax.R
echo 'end of script 03'
echo 'finished'
