# WGS Variant Calling Pipeline (Laptop-Friendly)

This repository contains a **step-by-step Whole Genome Sequencing (WGS) variant calling pipeline** based on the Galaxy Project tutorial and adapted for standalone execution.  
It uses publicly available **1000 Genomes Project** data and performs **alignment, variant calling, and filtering** with commonly used bioinformatics tools.

---

## **Workflow Overview**

1. **Download data** – FASTQ reads & reference genome.  
2. **Quality Control (QC)** – FastQC & MultiQC reports.  
3. **Alignment** – Map reads to reference genome using BWA.  
4. **Sort & Index BAM** – Using Samtools.  
5. **Variant Calling** – Call SNPs and Indels using BCFtools.  
6. **Variant Filtering** – Filter variants based on quality and depth.  

---

## **Repository Structure**

```
wgs-variant-calling/
├── scripts/
│   ├── 01_download_data.sh
│   ├── 02_qc.sh
│   ├── 03_align.sh
│   ├── 04_sort_index.sh
│   ├── 05_variant_calling.sh
│   ├── 06_filter_vcf.sh
│   └── 07_alignment_stats.sh
├── results/
│   ├── fastqc/
│   ├── bam/
│   ├── vcf/
│   └── alignment_stats/
├── data/
│   ├── SRR062634_1.filt.fastq.gz
│   ├── SRR062634_2.filt.fastq.gz
│   └── Homo_sapiens.GRCh38.dna.chromosome.20.fa
├── environment.yml
└── README.md
```

---

## **Environment Setup**

Install dependencies via Conda:

```bash
conda env create -f environment.yml
conda activate wgs-pipeline
```

`environment.yml` contains:

```yaml
name: wgs-pipeline
channels:
  - bioconda
  - conda-forge
dependencies:
  - fastqc
  - multiqc
  - bwa
  - samtools
  - bcftools
  - htslib
  - openjdk
  - gatk4 (OPT)
```

---

## **Scripts Overview**

- **01_download_data.sh** – Download FASTQ reads and reference genome.  
- **02_qc.sh** – Run FastQC and MultiQC.  
- **03_align.sh** – Align reads to reference using BWA.  
- **04_sort_index.sh** – Sort and index BAM files.  
- **05_variant_calling.sh** – Call variants using BCFtools.  
- **06_filter_vcf.sh** – Filter variants by quality and depth.  
- **07_alignment_stats.sh** – Generate basic alignment stats (text-based).

---

## **Running the Pipeline**

```bash
bash scripts/01_download_data.sh
bash scripts/02_qc.sh
bash scripts/03_align.sh
bash scripts/04_sort_index.sh
bash scripts/05_variant_calling.sh
bash scripts/06_filter_vcf.sh
bash scripts/07_alignment_stats.sh
```

---

## **Outputs**

- **QC Reports:** `results/fastqc/`  
- **Aligned BAM files:** `results/bam/`  
- **Variants (VCF):** `results/vcf/`  
- **Alignment Statistics:** `results/alignment_stats/`  

---

## **Notes**

- Large files (FASTQ, BAM, VCF) can be ignored in GitHub via `.gitignore`.  
- Optional plots generated previously by gnuplot are included.

---

## **License**

MIT License

---

## **Citation**

Please cite relevant tools: BWA, Samtools, BCFtools, FastQC, MultiQC.
