#!/bin/bash

# tail -n +2  config/pe_samples.tsv | cut -f1 >config/sra_accs.txt;

for i in $(cat config/sra_accs.txt); 
    do
        fasterq-dump $i \
        --split-3 \
        --force \
        --skip-technical \
        --outdir data/reads \
        --temp data/temp \
        --threads 4	
    done
