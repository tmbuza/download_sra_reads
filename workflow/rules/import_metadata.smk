# Import metadata

rule import_metadata:
    output:
        samples="config/samples.tsv",
        units="config/units.tsv"
    shell:
        "bash workflow/scripts/import_metadata.sh"
        
