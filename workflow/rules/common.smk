import os
import csv
import pandas as pd

METADATA = (
    pd.read_csv(config["pe_samples"], sep="\t", dtype={"sample_name": str})
    .set_index("sample_name", drop=False)
    .sort_index()
)

SAMPLES = METADATA["sample_name"]

OUTDIR="data/reads" 
TEMPDIR="data/temp"

if not os.path.exists(OUTDIR):
   os.makedirs(OUTDIR)

if not os.path.exists(TEMPDIR):
   os.makedirs(TEMPDIR)



