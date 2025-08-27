#!/bin/bash
set -euo pipefail

mkdir -p ../results/bam

# Index reference
bwa index ../data/Homo_sapiens.GRCh38.dna.chromosome.20.fa

# Align paired-end reads
bwa mem -t 4 ../data/Homo_sapiens.GRCh38.dna.chromosome.20.fa \
 ../data/SRR062634_1.filt.fastq.gz ../data/SRR062634_2.filt.fastq.gz \
 | samtools view -bS - > ../results/bam/sample.bam

echo "Alignment complete. BAM file: ../results/bam/sample.bam"
