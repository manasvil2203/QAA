#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1             #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=manasvil@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --time=2:00:00
#SBATCH --job-name=htseq         #optional: job name
#SBATCH --output=htseq_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=htseq_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID

mamba activate QAA

/usr/bin/time -v htseq-count -f bam -r pos --stranded=yes -i gene_id  ./SRR25630311_STAR/STAR_campyAligned.out.sorted.dedup.bam ./campy_ref_website/campylomormyrus.gtf > counts_SRR25630311_yes.txt

/usr/bin/time -v htseq-count -f bam -r pos --stranded=reverse -i gene_id  ./SRR25630311_STAR/STAR_campyAligned.out.sorted.dedup.bam ./campy_ref_website/campylomormyrus.gtf > counts_SRR25630311_reverse.txt

/usr/bin/time -v htseq-count -f bam -r pos --stranded=yes -i gene_id  ./SRR25630392_STAR/STAR_campy2Aligned.out.sorted.dedup.bam ./campy_ref_website/campylomormyrus.gtf > counts_SRR25630392_yes.txt

/usr/bin/time -v htseq-count -f bam -r pos --stranded=reverse -i gene_id  ./SRR25630392_STAR/STAR_campy2Aligned.out.sorted.dedup.bam ./campy_ref_website/campylomormyrus.gtf > counts_SRR25630392_reverse.txt