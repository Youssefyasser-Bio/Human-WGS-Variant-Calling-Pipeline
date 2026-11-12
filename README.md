# Human Whole Genome Sequencing (WGS) Variant Calling Pipeline

## Overview
A hands-on bioinformatics project implementing a human Whole Genome Sequencing (WGS) variant-calling workflow using Linux and command-line bioinformatics tools.

## Dataset
- **Sample:** SRR062634
- **Organism:** Homo sapiens
- **Reference genome:** GRCh38
- **Sequencing:** Paired-end Illumina

## Workflow
1. Raw read quality control using FastQC.
2. Read trimming using Trimmomatic.
3. Post-trimming quality control using FastQC.
4. Read alignment using BWA-MEM.
5. BAM conversion, sorting, and indexing using SAMtools.
6. Duplicate marking using GATK MarkDuplicates.
7. Variant calling using GATK HaplotypeCaller.
8. Genotyping using GATK GenotypeGVCFs.

## Tools
- Linux / WSL
- FastQC
- Trimmomatic 0.39
- BWA
- SAMtools
- GATK 4.6.2.0
- Java 21

## Preliminary Results
- Paired reads after trimming: 56,619 pairs.
- Mapping rate: 99.57%.
- Properly paired reads: 97.39%.
- Duplicate reads: 324.
- VCF variant records: 1,019.

## Important Limitation
The processed reads represent only a small subset of the original SRA dataset. The resulting sequencing coverage is extremely low, and the variant calls are preliminary. These results should not be used for reliable biological interpretation.

## Project Structure
```text
Human-WGS-Variant-Calling-Pipeline/
├── config.sh
├── scripts/
├── results/
├── images/
└── README.md
```

## Data Source
NCBI Sequence Read Archive (SRA): [SRR062634](https://www.ncbi.nlm.nih.gov/sra/SRX025016)

## Author
Biotechnology student interested in bioinformatics, genomics, and computational biology.
