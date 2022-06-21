#!/bin/bash
while getopts i:t:h: flag
do
    case "${flag}" in
        i) ref_fasta=${OPTARG};;
		t) threads=${OPTARG};;
        h) echo "Syntax: bowtie2_index [-t][-i][-h help]"
           echo "options:"
           echo "-t     number of threads"
           echo "-i     reference fasta genome"
           echo "-h             Help." ;;
		\?) # Invalid option
        echo "Error: Invalid option"
        exit;;
    esac
done

echo "Number of threads: $t";
echo "Reference Genome: $i";
out=$(basename $ref_fasta .fasta);
bowtie2-build --threads $threads $ref_fasta $out