#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

[[ -x "$GATK" ]] || { echo "ERROR: GATK executable not found: $GATK"; exit 1; }
INPUT_BAM="$BAM_DIR/${SAMPLE}_sorted.bam"
[[ -s "$INPUT_BAM" ]] || { echo "ERROR: Sorted BAM not found. Run 05_bam_processing.sh first."; exit 1; }

mkdir -p "$BAM_DIR"
"$GATK" MarkDuplicates \
  -I "$INPUT_BAM" \
  -O "$BAM_DIR/${SAMPLE}_marked_duplicates.bam" \
  -M "$BAM_DIR/${SAMPLE}_marked_dup_metrics.txt" \
  --CREATE_INDEX true
