# ISG 5312 finalProject README.md

This project involves the re-analysis of single-cell RNA-sequencing data originating from the below citation:

Medina-Cano D, Islam MT, Petrova V, Dixit S, Balic Z, Yang MG, Stadtfeld M, Wong ES, Vierbuchen T. A mouse organoid platform for modeling cerebral cortex development and cis-regulatory evolution in vitro. Dev Cell. 2025 Dec 15;60(24):3544-3560.e8. doi: 10.1016/j.devcel.2025.08.001. Epub 2025 Aug 27. PMID: 40876454; PMCID: PMC12404679. 

The primary aim of this paper was the generation of cortical brain organoids from hybrid mouse ESCs to assess the differences in cis-regulatory mechanisms and allele-specific gene expression across evolutionary divergence. Techniques utilized in the paper include scRNA-seq, snRNA-seq, bulk RNA-seq, and snATAC-seq. 

The aim of my final project will be to map, demultiplex, and analyze/visualize the day 12 scRNA-seq results from the clone 2 organoid population to assess the different cortical cell types present across each genetic background. 

## Raw Data

BioProject: PRJNA1116224

SRA Study: SRP509828

SRR Runs (4): SRR29176487-SRR29176490

Organism: Mus Musculus

Sequencing Type: Paired-end single cell RNA seq 

Data size (GB): 46.6GB

Bases: 162.9G

## Directory Structure

/genomes -> mus musculus genome info

/scripts -> data downloading, mapping, demultiplexing, single cell analysis scripts

/vcf -> VCF info for each inbred mouse strain, to be used for demultiplexing

### /results/

    01_cellranger -> raw alignment, gene counting output
  
    02_cellsnp_vireo -> genome demultiplexing results
  
    03_seurat -> seurat objects
  
    04_umaps -> embedding visualizations 
  
    05_markers -> differential expression results 
  
    06_figures -> plots to be submitted for final project credit
    
  
  





