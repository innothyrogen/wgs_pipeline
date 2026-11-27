#!/bin/bash
#
#SBATCH -J happy
#SBATCH --nodes 1
#SBATCH --cpus-per-task 16
#SBATCH --mem 64G
#SBATCH -o %x_%A.out

QUERY_VCF=$1

set -x

eval "$(conda shell.bash hook)"
conda activate happy

hap.py \
        /lustre/data/innothyrogen/benchmarking/HG001_GRCh38_1_22_v4.2.1_benchmark.vcf.gz \
        $QUERY_VCF \
        -r /lustre/imgge/lab01/refs/hg38_GIAB.fasta \
        -f /lustre/data/innothyrogen/benchmarking/HG001_GRCh38_1_22_v4.2.1_benchmark.bed \
        -o ${QUERY_VCF}_happy \
        --threads 16

