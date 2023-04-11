#!/bin/bash

# Creating basic variables
METADATADIR="../imap-sample-metadata/config"
OUTDIR="config"


echo PROGRESS: "Importing samples and units metadata files"

mkdir -p "${OUTDIR}"

cp "${METADATADIR}"/*.tsv "${OUTDIR}"/


