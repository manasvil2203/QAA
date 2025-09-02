#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8             #optional: number of cpus, default is 1
#SBATCH --mem=48GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=manasvil@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --time=8:00:00
#SBATCH --job-name=star_db          #optional: job name
#SBATCH --output=star_db_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=star_db_31_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID

mamba activate QAA

/usr/bin/time -v STAR \
--runMode genomeGenerate \
--genomeDir Campylomormyrus.compressirostris.dna.dryad.STAR_2.7.11b \
 --genomeFastaFiles campylomormyrus.fasta \
 --sjdbGTFfile campylomormyrus.gtf \
 --genomeSAindexNbases 13