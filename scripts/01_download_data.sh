#!/bin/bash
set -euo pipefail

# Create data directory
mkdir -p ../data
cd ../data

# Download paired-end reads (subset)
wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00096/sequence_read/SRR062634_1.filt.fastq.gz
wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00096/sequence_read/SRR062634_2.filt.fastq.gz

# Download human reference (chr20 only)
wget ftp://ftp.ensembl.org/pub/release-110/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.20.fa.gz
gunzip Homo_sapiens.GRCh38.dna.chromosome.20.fa.gz

echo "Download complete. Data is in ../data/"

