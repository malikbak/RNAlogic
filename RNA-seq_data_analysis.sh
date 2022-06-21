#!/bin/bash
while getopts 1:2:r:g:h: flag
do
    case "${flag}" in
        1) forward=${OPTARG};;
        2) reverse=${OPTARG};;
        r) reference=${OPTARG};;
        g) annotation=${OPTARG};;
        h) echo "Syntax: RNAseq_data_analysis [-1][-2][-r][-g]"
           echo "options:"
           echo "-1     Forward reads."
           echo "-2     Reverse reads."
           echo "-r     Reference prefix of bowtie2 index."
           echo "-g     Genome annotation file in gff3 formate."
           echo "-h             Help." ;;
		\?) # Invalid option
        echo "Error: Invalid option"
        exit;;
    esac
done
echo "Forward reads: $forward";
echo "Reverse reads: $reverse";
echo "Refernce prefix: $reference";
echo "Annotation file gff3: $annotation";
########## Main Program #################
out=$(basename $forward _1.fastq);
echo "Alignemt using bowtie2 for $out";
bowtie2 -p 16 -x $reference -1 $forward -2 $reverse -S $out.sam
echo "Sorting the Alignment file";
samtools sort -@ 16 -o $out.bam $out.sam
echo "Stringtie quantification";
stringtie $out.bam -l $out -p 16 -G $annotation -o $out.gtf