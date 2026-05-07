#!/bin/bash
#SBATCH --job-name=download_ref
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH --time=04:00:00
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o download_ref_%j.out
#SBATCH -e download_ref_%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=nora.lippai@uconn.edu

# Define output directory
OUTDIR=../../reference

# Download reference transcriptome
wget "https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCm39-2024-A.tar.gz"

# Move reference transcriptome to output directory
mv refdata-gex-GRCm39-2024-A.tar.gz $OUTDIR

# Extract reference transcriptome from gzipped file
tar -xzf ../../reference/refdata-gex-GRCm39-2024-A.tar.gz -C ../../reference/
