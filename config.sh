#!/usr/bin/env bash
# Shared configuration for the Human WGS variant-calling workflow.
# Edit these paths if your software/reference files are stored elsewhere.

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Input FASTQ files (place both files in data/raw/)
SAMPLE="SRR062634"
R1="$PROJECT_DIR/data/raw/${SAMPLE}_1_final.fastq.gz"
R2="$PROJECT_DIR/data/raw/${SAMPLE}_2_final.fastq.gz"

# Reference genome and software locations on the original WSL machine.
# Change these if you move the project to another computer.
REF="/mnt/d/linux/Trimmomatic-0.39/Homo_sapiens.GRCh38.dna.primary_assembly.fa"
TRIMMOMATIC_JAR="/mnt/d/linux/Trimmomatic-0.39/trimmomatic-0.39.jar"
GATK="/mnt/d/linux/Trimm/gatk-4.6.2.0/gatk"

THREADS=4

# Project output directories
RAW_QC="$PROJECT_DIR/results/fastqc_raw"
TRIM_DIR="$PROJECT_DIR/results/trimmed"
TRIM_QC="$PROJECT_DIR/results/fastqc_trimmed"
ALIGN_DIR="$PROJECT_DIR/results/alignment"
BAM_DIR="$PROJECT_DIR/results/bam"
VARIANT_DIR="$PROJECT_DIR/results/variants"
