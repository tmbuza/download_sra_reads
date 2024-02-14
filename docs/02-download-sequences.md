# Downloading multiple fastq files
- Make sure that the `fasterq-dump` is in the path.
- Type `which fasterq-dump` or `fasterq-dump --help` to confirm.
- Must specify the output and temporary files.
- It is possible to specifies a range of SRA accessions in a `for loop`.

Example code for downloading reads from the NCBI-SRA for accessions ranging from SRR7450706 to SRR7450761.

```bash
for (( i = 706; i <= 761; i++ ))
	do
        time fasterq-dump SRR7450$i \
        --split-3 \
        --force \
        --skip-technical \
        --outdir data/reads \
        --temp data/temp \
        --threads 4		
	done
