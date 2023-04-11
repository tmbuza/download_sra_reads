#!/bin/bash

tail -n +2  config/samples.tsv | cut -f1 >config/acc.txt;

for i in $(cat config/acc.txt); 
    do
        fasterq-dump $i \
        --split-3 \
        --force \
        --skip-technical \
        --outdir data/reads \
        --temp data/temp \
        --threads 4	
    done

pigz data/reads/*.fastq; 

# for i in *_1.fastq; do mv $i ${i%_1.fastq}_R1.fastq; done
# for i in *_2.fastq; do mv $i ${i%_2.fastq}_R1.fastq; done
