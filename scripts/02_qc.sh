#!/bin/bash
set -euo pipefail

# Create output folder
mkdir -p ../results/fastqc

# Run FastQC
fastqc -o ../results/fastqc ../data/SRR062634_1.filt.fastq.gz ../data/SRR062634_2.filt.fastq.gz

# Run MultiQC
multiqc ../results/fastqc -o ../results/fastqc

echo "QC complete. Reports in ../results/fastqc"

