#!/bin/bash
set -euo pipefail

mkdir -p ../results/vcf

# Quality-based filtering
bcftools filter -s LOWQUAL -e '%QUAL<20 || DP<10' \
 ../results/vcf/sample.raw.vcf.gz -Oz -o ../results/vcf/sample.filtered.vcf.gz

# Index filtered VCF
bcftools index ../results/vcf/sample.filtered.vcf.gz

# Generate basic stats
bcftools stats ../results/vcf/sample.filtered.vcf.gz > ../results/vcf/vcf_stats.txt

echo "Filtering complete. Filtered VCF: ../results/vcf/sample.filtered.vcf.gz"
echo "VCF stats: ../results/vcf/vcf_stats.txt"
