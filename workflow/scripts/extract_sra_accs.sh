#!/bin/bash

tail -n +2  config/pe_samples.tsv | cut -f1 >config/sra_accs.txt;