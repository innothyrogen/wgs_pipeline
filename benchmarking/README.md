This folder holds the scripts, config and params files for benchmarking sarek using the HG001 standard genome sequenced on MGI.

The folder contains 3 scripts, one with no preprocessing (benchmarking_none.sh), one with MarkDuplicates (benchmarking_md.sh), and one with MarkDuplicates and BQSR (benchmarking_bqsr.sh).
To run them, open them and change all instances of initials (DP) with your own initials. Then simply run them with sbatch.

The output is hardcoded to go into the benchmarking folder, in a subfolder with your initials, in which you will find the sarek results and work diectories. The logs go directly to the benchmarking folder.

Once results are obtained, they can be benchmarked with happy.sh, which takes the final vcf file as a positional argument (eg. sbatch happy.sh bla.vcf.gz). For this to work you must have a conda enviroment called happy with hap.py installed. To create one, run: "conda create -n happy -c conda-forge -c bioconda hap.py".