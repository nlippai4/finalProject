#!/bin/bash
#SBATCH --job-name=download_reads
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem=60G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=nora.lippai@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

# Load necessary modules
module load sratoolkit/3.0.5
module load pigz

# Define directories (adjust as needed)
dataDir=/home/FCAM/nlippai/ISG/finalProject/rawdata/clone3
sraDir=/home/FCAM/nlippai/ISG/finalProject/rawdata/sraCache/SRR29176459
export TMPDIR=/home/FCAM/nlippai/ISG/finalProject/rawdata/tmp

mkdir -p "$dataDir" "$TMPDIR"

# Download scRNA-seq fastq files
fasterq-dump "${sraDir}" \
    --threads 8 \
    --split-files \ # Need separate barcode, index, biological reads
    --include-technical \
    --size-check off \
    --outdir "$dataDir" \
    --temp "$TMPDIR"

# Compress raw data
pigz -p 8 "$dataDir"/SRR29176459_*.fastq
