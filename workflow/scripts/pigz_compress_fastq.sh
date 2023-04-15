#!/bin/bash

# pigz -d data/reads/*.fastq*; 

pigz --keep --force data/reads/*.fastq
