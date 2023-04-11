# Import metadata

rule get_sra_metadata:
    input:
       script="workflow/scripts/import_metadata.sh"
    output:
        samples="config/samples.tsv",
        units="config/units.tsv"
    shell:
        "bash {input.script}"

        
