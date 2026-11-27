#!/bin/bash
#
#SBATCH -J sarek-DP-bqsr
#SBATCH --nodes 1
#SBATCH --cpus-per-task 32
#SBATCH --mem 128G
#SBATCH -o /lustre/data/innothyrogen/benchmarking/%x_%A.out

set -x

module load Nextflow
module load apptainer

export NXF_SINGULARITY_CACHEDIR="/lustre/imgge/containers/nxf_singularity_cache"

mkdir -p /lustre/data/innothyrogen/benchmarking/DPout/bqsr
cd /lustre/data/innothyrogen/benchmarking/DPout/bqsr

nextflow -log /lustre/data/innothyrogen/benchmarking/DPout/bqsr/nextflow.log \
        run ~/sarek/main.nf \
        -profile singularity \
        -params-file ~/sarek/benchmarking/params_bqsr.yaml \
        -c ~/sarek/benchmarking/MGI_benchmarking.config \
        --input ~/sarek/benchmarking/HG001_MGI.csv \
        --outdir /lustre/data/innothyrogen/benchmarking/DPout/bqsr/output \
        -work-dir /lustre/data/innothyrogen/benchmarking/DPout/bqsr/work \
        -ansi-log false \
        -resume
