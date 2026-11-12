#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

[[ -x "$GATK" ]] || { echo "ERROR: GATK executable not found: $GATK"; exit 1; }
[[ -s "$REF" ]] || { echo "ERROR: Reference FASTA not found: $REF"; exit 1; }
INPUT_BAM="$BAM_DIR/${SAMPLE}_marked_duplicates.bam"
[[ -s "$INPUT_BAM" ]] || { echo "ERROR: Marked-duplicates BAM not found. Run 06_mark_duplicates.sh first."; exit 1; }

mkdir -p "$VARIANT_DIR"
"$GATK" HaplotypeCaller \
  -R "$REF" \
  -I "$INPUT_BAM" \
  -O "$VARIANT_DIR/${SAMPLE}.g.vcf.gz" \
  -ERC GVCF \
  --native-pair-hmm-threads 2

"$GATK" GenotypeGVCFs \
  -R "$REF" \
  -V "$VARIANT_DIR/${SAMPLE}.g.vcf.gz" \
  -O "$VARIANT_DIR/${SAMPLE}.vcf.gz"
