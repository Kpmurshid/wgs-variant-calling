#!/bin/bash
set -euo pipefail

mkdir -p ../results/alignment_stats

# Generate flagstat and stats reports
samtools flagstat ../results/bam/sample.sorted.bam > ../results/alignment_stats/flagstat.txt
samtools stats ../results/bam/sample.sorted.bam > ../results/alignment_stats/alignment_stats.txt

# Optional: plot BAM stats (generates PNG/PDF plots)
plot-bamstats -p ../results/alignment_stats/ ../results/alignment_stats/alignment_stats.txt

echo "Alignment stats generated in ../results/alignment_stats/"
