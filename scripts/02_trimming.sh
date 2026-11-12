#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

[[ -s "$R1" && -s "$R2" ]] || { echo "ERROR: Raw FASTQ files not found in data/raw/."; exit 1; }
[[ -f "$TRIMMOMATIC_JAR" ]] || { echo "ERROR: Trimmomatic JAR not found: $TRIMMOMATIC_JAR"; exit 1; }

mkdir -p "$TRIM_DIR"
java -jar "$TRIMMOMATIC_JAR" PE -threads "$THREADS" \
  "$R1" "$R2" \
  "$TRIM_DIR/${SAMPLE}_R1_paired.fastq.gz" \
  "$TRIM_DIR/${SAMPLE}_R1_unpaired.fastq.gz" \
  "$TRIM_DIR/${SAMPLE}_R2_paired.fastq.gz" \
  "$TRIM_DIR/${SAMPLE}_R2_unpaired.fastq.gz" \
  TRAILING:10
