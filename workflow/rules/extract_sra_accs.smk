rule extract_sra_accessions: 
    input:
        samples="config/pe_samples.tsv",
    output:
        acc="config/sra_accs.txt",
    script:
        "../scripts/extract_sra_accs.sh"

# rule extract_sra_accessions: 
#     input:
#         samples="config/samples.tsv",
#     output:
#         acc="results/run_accessions.txt",
#     script:
#         "../scripts/get_sra_accessions.py"