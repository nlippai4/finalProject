#!/bin/bash
#SBATCH --job-name=vireo_clone4
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=200G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=nora.lippai@uconn.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

# Load conda environment containing vireo
module load miniconda3
source $(conda info --base)/etc/profile.d/conda.sh
conda activate vireo_env

# Specify directories (note - must be done for each clone)
cellData=../../results/02_cellsnp_pooled/clone4/
donorVCF=../../vcf/subset/clone4/all_strains_merged_sub.vcf.gz
outDir=../../results/03_vireo/clone4/

mkdir -p $outDir

# Run vireo using 8 threads
vireo \
    -c ${cellData} \
    -d ${donorVCF} \
    -o ${outDir} \
    -t PL \
    -p 8
