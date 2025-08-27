#!/bin/bash
set -euo pipefail

mkdir -p ../results/bam

# Sort BAM
samtools sort -o ../results/bam/sample.sorted.bam ../results/bam/sample.bam

# Index BAM
samtools index ../results/bam/sample.sorted.bam

echo "Sorting & indexing complete. Sorted BAM: ../results/bam/sample.sorted.bam"
