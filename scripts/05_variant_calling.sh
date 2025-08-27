#!/bin/bash
set -euo pipefail

mkdir -p ../results/vcf

# Variant calling using bcftools
bcftools mpileup -Ou -f ../data/Homo_sapiens.GRCh38.dna.chromosome.20.fa ../results/bam/sample.sorted.bam | \
 bcftools call -mv -Oz -o ../results/vcf/sample.raw.vcf.gz

# Index VCF
bcftools index ../results/vcf/sample.raw.vcf.gz

echo "Variant calling complete. VCF: ../results/vcf/sample.raw.vcf.gz"

# Optional annotation (commented out)
# snpEff GRCh38.86 ../results/vcf/sample.raw.vcf.gz > ../results/vcf/sample.ann.vcf
