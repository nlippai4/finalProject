#!/bin/bash
#SBATCH --job-name=filter_vcfs
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=6G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=nora.lippai@uconn.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

# Define directories
VCFdir=../../vcf/original/
filtDir=../../vcf/filtered/

mkdir -p ${filtDir}

# Load modules
module load bcftools
module load tabix 

# Filter VCFs for necessary strains
bcftools view -s CAST_EiJ ${VCFdir}mgp_REL2021_snps.vcf.gz -Oz -o ${filtDir}CAST_EiJ.vcf.gz
bcftools view -s PWK_PhJ ${VCFdir}mgp_REL2021_snps.vcf.gz -Oz -o ${filtDir}PWK_PhJ.vcf.gz
bcftools view -s MOLF_EiJ ${VCFdir}mgp_REL2021_snps.vcf.gz -Oz -o ${filtDir}MOLF_EiJ.vcf.gz
bcftools view -s SPRET_EiJ ${VCFdir}mgp_REL2021_snps.vcf.gz -Oz -o ${filtDir}SPRET_EiJ.vcf.gz

# Index VCFs
tabix -p vcf ${filtDir}CAST_EiJ.vcf.gz
tabix -p vcf ${filtDir}MOLF_EiJ.vcf.gz
tabix -p vcf ${filtDir}PWK_PhJ.vcf.gz
tabix -p vcf ${filtDir}SPRET_EiJ.vcf.gz
