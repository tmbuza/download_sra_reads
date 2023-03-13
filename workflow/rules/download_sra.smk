from snakemake.utils import min_version

min_version("6.10.0")

# Configuration file containing all user-specified settings
configfile: "config/config.yaml"


import os
import csv
import pandas as pd

METADATA=pd.read_csv('data/metadata/SraRunTable.csv').loc[0:3]
ACCESSIONS=METADATA['Run'].tolist()
OUTDIR="data/reads" 
TEMPDIR="data/temp"

if not os.path.exists(OUTDIR):
   os.makedirs(OUTDIR)

if not os.path.exists(TEMPDIR):
   os.makedirs(TEMPDIR)

# Master rule for controlling workflow.
rule all:
    input:
        "data/metadata/metadata.csv",
        "data/metadata/sra_accessions.txt",
        # expand("{outdir}/{accession}_1.fastq", outdir=OUTDIR, accession=ACCESSIONS),
        # expand("{outdir}/{accession}_2.fastq", outdir=OUTDIR, accession=ACCESSIONS),
        expand("resources/reads/{accession}_1.fastq.gz", outdir=OUTDIR, accession=ACCESSIONS),
        expand("resources/reads/{accession}_2.fastq.gz", outdir=OUTDIR, accession=ACCESSIONS),


# Get SRA accessions, the first column of metadata
rule get_sra_accessions:
    input:
        sra_acc="data/metadata/metadata.csv"
    output:
        sra_acc="data/metadata/sra_accessions.txt",
    script:
        "scripts/get_sra_accessions.py"

# Dowload the SRA RUN reads
rule fasterqdump_sra_reads: 
    input:
        rules.get_sra_accessions.output.sra_acc
    output:
        "{outdir}/{accession}_1.fastq",
        "{outdir}/{accession}_2.fastq"
    params:
        download_folder=OUTDIR,
        subset_folder=OUTDIR,
    threads: 1
    shell:
        """
        fasterq-dump \
        --split-3 \
        --force \
        --skip-technical {wildcards.accession} \
        --outdir {params.download_folder} \
        --temp {params.subset_folder} \
        --threads {threads}
        """

rule get_zipped_data: 
    input:
        script="workflow/scripts/gzip_fastq.sh",
        reads=rules.fasterqdump_sra_reads.output
    output:
        "resources/reads/{accession}_1.fastq.gz",
        "resources/reads/{accession}_2.fastq.gz",
    shell:
        "bash {input.script}"



