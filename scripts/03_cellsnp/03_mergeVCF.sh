#!/bin/bash
#SBATCH --job-name=merge_vcfs_clone3
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=nora.lippai@uconn.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

# Define directory
VCFdir=../../vcf/filtered/

# Load bcftools
module load bcftools 

# Merge VCFs
bcftools merge \
    ${VCFdir}CAST_EiJ.vcf.gz \
    ${VCFdir}MOLF_EiJ.vcf.gz \
    ${VCFdir}PWK_PhJ.vcf.gz \
    ${VCFdir}SPRET_EiJ.vcf.gz \
    --missing-to-ref \
    -Oz -o ${VCFdir}all_strains_merged.vcf.gz

# Index merged VCF
bcftools index ${VCFdir}all_strains_merged.vcf.gz
