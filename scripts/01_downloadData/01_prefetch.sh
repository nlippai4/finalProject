#!/bin/bash
#SBATCH --job-name=prefetch
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

# Load required modules
module load sratoolkit/3.0.5

# Define directories (adjust as needed)
dataDir=/home/FCAM/nlippai/ISG/finalProject/rawdata/clone4
sraCache=/home/FCAM/nlippai/ISG/finalProject/rawdata/sraCache
export TMPDIR=/home/FCAM/nlippai/ISG/finalProject/rawdata/tmp

mkdir -p "$dataDir" "$sraCache" "$TMPDIR"

# Begin fastq download
prefetch SRR29176459 -O "$sraCache" --max-size u
