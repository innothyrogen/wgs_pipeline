#!/bin/bash
#
# Run ....
#
#SBATCH -J nfc-sarek                         # A single job name for the array
#SBATCH --cpus-per-task 16                   # 16 CPUs (threads)
#SBATCH --nodes 1                            # one node
#SBATCH --time 2-00                          # Running time of 2 days
#SBATCH --mem 32G                            # Memory request
#SBATCH --chdir /lustre/data/innothyrogen/custom_config_test/
#SBATCH -o %x_%A.out

#module load bioinfo
module load Nextflow
module load apptainer

export NXF_SINGULARITY_CACHEDIR="/lustre/imgge/containers/nxf_singularity_cache"

INPUT="samplesheet.csv"
OUTPUT="output/"
CRAM_DIR="cram_dir/"
VCF_DIR="vcf_dir/"
CONFIG="${HOME}/sarek/custom.config"
PARAMS_FILE="${HOME}/sarek/params.yaml"
WORK_DIR="work_dir/"

# add option for user to resume from commandline
# add samplesheet for the user to specify from commandline


nextflow run ~/sarek/main.nf \
        -profile singularity \
        -params-file $PARAMS_FILE \
        --input $INPUT \
        --outdir $OUTPUT \
        --cram_dir $CRAM_DIR \
        -c $CONFIG \
        -work-dir $WORK_DIR \
        -ansi-log false \
        -resume

        # TODO: add vcf
