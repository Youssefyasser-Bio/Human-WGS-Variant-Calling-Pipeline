#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

command -v fastqc >/dev/null 2>&1 || { echo "ERROR: FastQC is not installed."; exit 1; }
R1_TRIM="$TRIM_DIR/${SAMPLE}_R1_paired.fastq.gz"
R2_TRIM="$TRIM_DIR/${SAMPLE}_R2_paired.fastq.gz"
[[ -s "$R1_TRIM" && -s "$R2_TRIM" ]] || { echo "ERROR: Trimmed FASTQ files not found. Run 02_trimming.sh first."; exit 1; }

mkdir -p "$TRIM_QC"
fastqc -t "$THREADS" -o "$TRIM_QC" "$R1_TRIM" "$R2_TRIM"
