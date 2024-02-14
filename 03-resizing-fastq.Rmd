# Resizing Fastq files
  - Sometimes we want to extract a small subset to test the bioinformatics pipeline.
  - You can resize the fastq files using the `seqkit sample` function [@seqkit2022].


Example extracting only 1% of the paired-end metagenomics sequencing data.

> This bash script extracts 1% of the reads from only two sample (SRR10245277 to SRR10245280)

```bash
mkdir -p data
for i in {77..80}
  do
    cat SRR102452$i\_1.fastq \
    | seqkit sample -p 0.01 \
    | seqkit shuffle -o data/SRR102452$i\_1_sub.fastq \
    | cat SRR102452$i\_2.fastq \
    | seqkit sample -p 0.01 \
    | seqkit shuffle -o data/SRR102452$i\_2_sub.fastq
  done
```
