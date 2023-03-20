#!/bin/bash

# Script: resize_fastq.sh

mkdir -p data

mkdir -p data
for i in {77..80}
  do
    cat SRR102452$i\_1.fastq \
    | seqkit sample -p 0.01 \
    | seqkit shuffle -o data/test/SRR102452$i\_1.fastq \
    | cat SRR102452$i\_2.fastq \
    | seqkit sample -p 0.01 \
    | seqkit shuffle -o data/test/SRR102452$i\_2.fastq
  done

  