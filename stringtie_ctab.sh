#!/bin/bash
module load stringtie/2.1.6
while getopts l:r:h:s: flag
do
    case "${flag}" in
        l) list=${OPTARG};;
        r) reference=${OPTARG};;
		s) sample=${OPTARG};;
        h) echo "Syntax: stringtie_ctab [-l][-r] [-s] [-h help]"
           echo "options:"
           echo "-l     txt file having gtf file name for sample."
           echo "-r     Reference prefix of bowtie2 index that is converted from gff3 to gtf duting RNAseq_data_analysis"
		   echo "-s		sample name that use as bam file input and gtf file with ctab output for ballgown"
           echo "-h             Help." ;;
		\?) # Invalid option
        echo "Error: Invalid option"
        exit;;
    esac
done

echo "Forward reads: $list";
echo "Reverse reads: $reference";
echo "output file: $reference.merge.gtf";
stringtie --merge -p 8 -G $reference.gtf -o $reference.merge.gtf $list
stringtie -e -B -p 8 -G $reference.merge.gtf -o ballgown/$sample/$sample.gtf $sample.bam