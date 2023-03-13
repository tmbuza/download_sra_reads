#!/bin/bash

for accession in $(cut -f 2 metadata.csv)
do
    printf "\n  Working on: ${accession}\n\n"
    fasterq-dump --split-files ${accession}

done
