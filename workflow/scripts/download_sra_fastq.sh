#!/bin/bash

# METADATA="data/metadata.csv"

# OUTDIR="data/reads" 
# TEMPDIR="data/temp"

# for accession in $(cut -f 1 ${METADATA})
# do
#     printf "\n  Working on: ${accession}\n\n"
#     fasterq-dump --split-files ${accession}

# done

for (( i = 706; i <= 761; i++ ))
	do
        time fasterq-dump SRR7450$i \
        --split-3 \
        --force \
        --skip-technical \
        --outdir data/reads \
        --temp data/temp \
        --threads 4;
        gzip;		
	done

# wget -O "raw_data/forward.fastq.gz" "https://data.qiime2.org/2019.1/tutorials/atacama-soils/10p/forward.fastq.gz"   
# wget -O "raw_data/reverse.fastq.gz" "https://data.qiime2.org/2019.1/tutorials/atacama-soils/10p/reverse.fastq.gz" 
# wget -O "raw_data/barcodes.fastq.gz" "https://data.qiime2.org/2019.1/tutorials/atacama-soils/10p/barcodes.fastq.gz"            