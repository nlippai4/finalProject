#!/bin/bash
#SBATCH --job-name=download_vcfs
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

# Define directory
VCFdir=../../vcf/original/

cd ${VCFdir}

# Download snp VCFs from Mouse Genomes Project
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/analysis/ERZ840/ERZ8406694/mgp_REL2021_snps.vcf.gz.tbi
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/analysis/ERZ840/ERZ8406694/mgp_REL2021_snps.vcf.gz
