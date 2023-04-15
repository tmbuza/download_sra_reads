rule pigz_if_uncompress: 
    input:
        fq=expand("{outdir}/{sample}_{sraNum}.fastq", outdir=OUTDIR, sample=SAMPLES, sraNum=config["sraNum"]),
    output:
        gzfq=expand("{outdir}/{sample}_{sraNum}.fastq.gz", outdir=OUTDIR, sample=SAMPLES, sraNum=config["sraNum"]),
    params:
    threads: 1
    shell:
        "bash workflow/scripts/pigz_compress_fastq.sh"