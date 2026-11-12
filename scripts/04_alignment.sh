#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

command -v bwa >/dev/null 2>&1 || { echo "ERROR: BWA is not installed."; exit 1; }
[[ -s "$REF" ]] || { echo "ERROR: Reference FASTA not found: $REF"; exit 1; }
R1_TRIM="$TRIM_DIR/${SAMPLE}_R1_paired.fastq.gz"
R2_TRIM="$TRIM_DIR/${SAMPLE}_R2_paired.fastq.gz"
[[ -s "$R1_TRIM" && -s "$R2_TRIM" ]] || { echo "ERROR: Trimmed FASTQ files not found. Run 02_trimming.sh first."; exit 1; }

# BWA index files must already exist next to the reference FASTA.
for ext in amb ann bwt pac sa; do
  [[ -s "${REF}.${ext}" ]] || { echo "ERROR: Missing BWA index ${REF}.${ext}. Run: bwa index \"$REF\""; exit 1; }
done

mkdir -p "$ALIGN_DIR"
bwa mem -t "$THREADS" \
  -R "@RG\\tID:${SAMPLE}\\tPL:ILLUMINA\\tSM:${SAMPLE}" \
  "$REF" "$R1_TRIM" "$R2_TRIM" \
  > "$ALIGN_DIR/${SAMPLE}.sam" \
  2> "$ALIGN_DIR/${SAMPLE}_bwa.log"
