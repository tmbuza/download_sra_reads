import os
import sys
import csv
import pandas as pd

METADATA=pd.read_csv('data/metadata/metadata_16S.csv').loc[0:4]
ACCESSIONS=METADATA['Run'].tolist()

with open('data/metadata/run_wgs_accessions.txt', 'w') as f:
    print(ACCESSIONS, file=f)

METADATA=pd.read_csv('data/metadata/metadata_WGS.csv').loc[0:4]
ACCESSIONS=METADATA['Run'].tolist()

with open('data/metadata/run_16S_accessions.txt', 'w') as f:
    print(ACCESSIONS, file=f)
