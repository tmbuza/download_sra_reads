rule fasterq_dump_sra_reads: 
    input:
        samples="config/sra_accs.txt",
    output:
        gzfq=expand("{outdir}/{sample}_{sraNum}.fastq", outdir=OUTDIR, sample=SAMPLES, sraNum=config["sraNum"]),
    params:
        outfolder=OUTDIR,
        temp=TEMPDIR,
        samples=config["pe_samples"],
    threads: 1
    shell:
        "bash workflow/scripts/fasterq_dump_fastq.sh"

