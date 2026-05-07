#!/bin/bash
#SBATCH --job-name=cellsnp_pooled_clone3
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 10
#SBATCH --mem=40G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=nora.lippai@uconn.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

# Define directories (note - will need to be run on data for each clone)
BAM=../../results/01_cellranger/clone3/clone3/outs/possorted_genome_bam.bam
BARCODE=../../results/01_cellranger/clone3/clone3/outs/filtered_feature_bc_matrix/barcodes.tsv.gz
outDir=../../results/02_cellsnp_pooled/clone3
vcfDir=../../vcf/merge/

mkdir -p ${outDir}

# Load conda environment containing cellsnp-lite
module load miniconda3
source $(conda info --base)/etc/profile.d/conda.sh
conda activate cellsnp

# Run cellsnp-lite, filtering out SNPs with less than 20 UMIs and 10% minor alleles
cellsnp-lite -s $BAM -b $BARCODE -O $outDir \
    -R ${vcfDir}all_strains_merged.vcf.gz \
    -p 10 --minMAF 0.1 --minCOUNT 20 --gzip
