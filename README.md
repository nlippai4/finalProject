# ISG 5312 finalProject README.md

This project involves the re-analysis of single-cell RNA-sequencing data originating from the below citation:

Medina-Cano D, Islam MT, Petrova V, Dixit S, Balic Z, Yang MG, Stadtfeld M, Wong ES, Vierbuchen T. A mouse organoid platform for modeling cerebral cortex development and cis-regulatory evolution in vitro. Dev Cell. 2025 Dec 15;60(24):3544-3560.e8. doi: 10.1016/j.devcel.2025.08.001. Epub 2025 Aug 27. PMID: 40876454; PMCID: PMC12404679. 

The primary aim of this paper was the generation of cortical brain organoids from hybrid mouse ESCs to assess the differences in cis-regulatory mechanisms and allele-specific gene expression across evolutionary divergence. Techniques utilized in the paper include scRNA-seq, snRNA-seq, bulk RNA-seq, and snATAC-seq. 

The aim of my final project will be to map, demultiplex, and analyze/visualize the day 12 scRNA-seq results from the clone 2 organoid population to assess the different cortical cell types present across each genetic background. 

## Raw Data

BioProject: PRJNA1116224

SRA Study: SRP509828

GEO accession number: GSE268332

Organism: Mus Musculus

Sequencing Type: Paired-end single cell RNA seq 

## Directory Structure

/rawdata -> directory in which raw fastq files should be downloaded 

/qc -> directory for fastqc results (note: I ran fastqc on a separate server using fastqc "filename.fastq"

/reference -> mus musculus reference transcriptome

/scripts -> data downloading, mapping, demultiplexing scripts

/vcf -> VCF info for each inbred mouse strain, to be used for demultiplexing

/jupyter_lab -> jupyter lab notebook and accessory files for single-cell analyses

### /results/

    01_cellranger -> raw alignment, gene counting output
  
    02_cellsnp -> snp pileup for variant-based demultiplexing
  
    03_vireo -> donor strain inference results based on cellsnp-lite output


## Pipeline schematic


<img width="1111" height="507" alt="image" src="https://github.com/user-attachments/assets/3597c9ee-1e17-4e87-bff6-dd7ad9d42821" />

 
    
  
  





