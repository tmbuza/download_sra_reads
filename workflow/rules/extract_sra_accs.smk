rule extract_sra_accession: 
    input:
        samples="config/samples.tsv",
    output:
        acc="results/run_accessions.txt",
    script:
        "../scripts/get_sra_accessions.py"