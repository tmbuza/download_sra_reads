# Subset a test data

SAMPLES = (
    pd.read_csv(config["samples"], sep="\t", dtype={"sample_name": str})
    .set_index("sample_name", drop=False)
    .sort_index()
)

rule resize_for_testing:
    input:
        expand("data/reads/{sample}_{sraNum}.fastq", sample=SAMPLES, sraNum=config["sraNum"]),
    output:
        expand("data/test/{sample}_{sraNum}.fastq", sample=SAMPLES, sraNum=config["sraNum"]),
    threads: 1
    shell:
        """
        bash workflow/scripts/resize_fastq.sh
        """

