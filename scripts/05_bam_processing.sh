#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

command -v samtools >/dev/null 2>&1 || { echo "ERROR: SAMtools is not installed."; exit 1; }
SAM="$ALIGN_DIR/${SAMPLE}.sam"
[[ -s "$SAM" ]] || { echo "ERROR: SAM file not found. Run 04_alignment.sh first."; exit 1; }

mkdir -p "$BAM_DIR"
samtools view -@ "$THREADS" -b -o "$BAM_DIR/${SAMPLE}.bam" "$SAM"
samtools sort -@ "$THREADS" -o "$BAM_DIR/${SAMPLE}_sorted.bam" "$BAM_DIR/${SAMPLE}.bam"
samtools index "$BAM_DIR/${SAMPLE}_sorted.bam"
samtools quickcheck -v "$BAM_DIR/${SAMPLE}_sorted.bam"
