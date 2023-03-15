#!/bin/bash

# Creating basic variables
METADATA="../imap-sample-metadata/data/metadata/metadata.csv"
OUTDIR="data/metadata"


###############################
echo PROGRESS: "Importing metadata from IMAP-PART 02"
###############################

mkdir -p "${OUTDIR}"

cp "${METADATA}" "${OUTDIR}"/metadata.csv


