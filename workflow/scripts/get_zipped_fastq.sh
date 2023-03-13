#!/bin/bash

OUTDIR="data/test"

###############################
echo PROGRESS: "Compressing the fastq files"
###############################

mkdir -p ${OUTDIR}

gzip --force --keep --quiet data/reads/*.fastq;

cp data/reads/*.fastq.gz "${OUTDIR}"/;