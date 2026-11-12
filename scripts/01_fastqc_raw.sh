#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

command -v fastqc >/dev/null 2>&1 || { echo "ERROR: FastQC is not installed."; exit 1; }
[[ -s "$R1" && -s "$R2" ]] || { echo "ERROR: Raw FASTQ files not found in data/raw/. See README."; exit 1; }

mkdir -p "$RAW_QC"
fastqc -t "$THREADS" -o "$RAW_QC" "$R1" "$R2"
