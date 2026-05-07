#!/bin/bash
#SBATCH --job-name=subset_vcfs_clone4
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=8G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=nora.lippai@uconn.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

# Specify directories (note - must be done for each clone)
VCFdir=../../vcf/merge/
cellsnpDir=../../results/02_cellsnp_pooled/clone4/
outDir=../../vcf/subset/clone4/

mkdir -p $outDir

# Load bcftools
module load bcftools

# Subset merged VCF using cellsnp-lite output

bcftools view ${VCFdir}all_strains_merged.vcf.gz \
    -R ${cellsnpDir}cellSNP.base.vcf.gz \
    -Oz -o ${outDir}all_strains_merged_sub.vcf.gz

# Index subsetted VCF
bcftools index ${outDir}all_strains_merged_sub.vcf.gz


