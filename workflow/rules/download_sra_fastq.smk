rule fasterq_dump_sra_reads: 
    input:
        samples="config/samples.tsv",
    output:
        gzfq=expand("{outdir}/{sample}.fastq.gz", outdir=OUTDIR, sample=SAMPLES),
    params:
        outfolder=OUTDIR,
        temp=TEMPDIR,
        samples="config/samples.tsv",
    threads: 1
    shell:
        "bash workflow/scripts/download_fastq_cutcat.sh"