# Human WGS Variant Calling Pipeline

## Project Overview

This project demonstrates a basic Whole Genome Sequencing (WGS) variant-calling workflow using Linux and commonly used bioinformatics tools.

The aim was to practice processing paired-end sequencing reads, aligning them to a human reference genome, processing BAM files, and performing variant calling.

## Dataset Information

- **Organism:** *Homo sapiens*
- **Sample:** HG00096
- **SRA Run:** [SRR062634](https://www.ncbi.nlm.nih.gov/sra/SRR062634)
- **SRA Experiment:** SRX025016
- **Reference genome:** GRCh38 (Ensembl primary assembly)
- **Sequencing layout:** Paired-end

****The FASTQ files processed in this project represent a small subset of the reads expected for the complete SRA run****

## Tools Used

- Linux / WSL
- Trimmomatic 0.39
- BWA-MEM 0.7.17
- SAMtools 1.19.2
- GATK 4.6.2.0
- BCFtools

## Workflow

1. **Read Trimming:** Adapter and low-quality base trimming using Trimmomatic.
2. **Read Alignment:** Mapping paired-end reads to the GRCh38 reference genome using BWA-MEM.
3. **BAM Processing:** SAM-to-BAM conversion, sorting, and indexing using SAMtools.
4. **Duplicate Marking:** Identifying PCR and optical duplicates using GATK MarkDuplicates.
5. **Variant Calling:** Generating a genomic VCF (GVCF) using GATK HaplotypeCaller.
6. **Genotyping:** Generating a VCF file using GATK GenotypeGVCFs.

## Preliminary Results

- Paired-end reads processed: 56,619 pairs after trimming.
- Total reads in the marked BAM: 113,238.
- Mapping rate: approximately 99.57%.
- Properly paired reads: approximately 97.4%.
- Variant records generated: 1,019.

## Important Data Limitation

The processed reads represent only a small fraction of the original SRA run. Consequently, the average genome-wide sequencing depth is extremely low.

Although the alignment and variant-calling commands completed successfully, the resulting variant calls are preliminary and have not been validated for reliable whole-genome variant discovery or biological interpretation.

A complete dataset and adequate sequencing coverage are required for reliable downstream analysis.

## Learning Outcomes

Through this project, I gained practical experience in:

- Working with Linux command-line tools.
- Processing paired-end sequencing data.
- Reference genome indexing and read alignment.
- BAM file manipulation and quality assessment.
- GATK-based variant calling.
- Understanding sequencing depth and its impact on variant-calling confidence.

## Data Source

NCBI Sequence Read Archive: [SRR062634](https://www.ncbi.nlm.nih.gov/sra/SRR062634)
