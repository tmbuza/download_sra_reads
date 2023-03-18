#!/bin/bash

# Script: resize_fastq.sh

mkdir -p data

for i in {77..78}
  do
    cat SRR102452$i\_R1.fastq \
    | seqkit sample -p 0.01 \
    | seqkit shuffle -o data/SRR102452$i\_R1_sub.fastq \
    | cat SRR102452$i\_R2.fastq \
    | seqkit sample -p 0.01 \
    | seqkit shuffle -o data/SRR102452$i\_R2_sub.fastq
  done

  