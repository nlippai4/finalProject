#!/bin/bash
#SBATCH --job-name=cellranger
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --mem=46G
#SBATCH --time=16:00:00
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o download_ref_%j.out
#SBATCH -e download_ref_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=nora.lippai@uconn.edu

# Define directories
INDIR=../../../rawdata/c3_cellranger/
OUTDIR=../../results/01_cellranger/clone3/
REF=../../../reference/refdata-gex-GRCm39-2024-A

mkdir -p $OUTDIR
cd ${OUTDIR}

# Load cellranger
module load cellranger

# Run cellranger (note - will need to be done on each clone's data, see sample and id parameters"
cellranger count \
  --id=clone3 \
  --transcriptome=${REF} \
  --fastqs=${INDIR} \
  --sample=clone3 \
  --create-bam=true\
  --localcores=14 \
  --localmem=40 
