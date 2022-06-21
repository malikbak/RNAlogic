# RNA-seq data analysis pipeline

## Running dependencies

#### 1- bowti2
#### 2- samtools 
#### 3- stringtie
#### 4- gffread




## Installation of dependencies using sudo



```bash
  sudo apt install bowtie2
```
```bash
  sudo apt install samtools
```
```bash
  sudo apt install stringtie
```
## Installation of dependencies using conda 
```bash
conda install -c bioconda bowtie2
```
```bash
conda install -c bioconda samtools
``` 
```bash
conda install -c bioconda stringtie
```
```bash 
conda install -c bioconda gffread
```
## Usage 

### bowtie2_index.sh
```bash
bash bowtie2_index.sh -t threads -i genome.fa 
# -t take the input integer value that is use as threads
# -i take reference fa file for making index
```
## Example 
```bash
bash bowtie2_index.sh -t 32 -i Homo_sapiens.GRCh38.dna.toplevel.fa
```
### RNAseq_data_analysis.sh

```bash
RNAseq_data_analysis [-1][-2][-r][-g]
# -1     Forward reads.
# -2     Reverse reads.
# -r     Reference prefix of bowtie2 index.
# -g     Genome annotation file in gtf formate.
```
## Example
```bash
bash RNAseq_data_analysis.sh -1 SRR13311153_1.fastq -2 SRR13311153_2.fastq -r Homo_sapiens.GRCh38.dna.toplevel -g Homo_sapiens.GRCh38.106.gtf
```
### stringtie_ctab.sh

```bash
stringtie_ctab [-l][-r] [-s]
# -l     txt file having gtf file name for sample.
# -r     Reference prefix of gtf file 
# -s	 sample name that use as bam file input and gtf file with ctab output for ballgown
```
## Example
```bash
stringtie_ctab.sh -l mergegtf.txt -r Homo_sapiens.GRCh38.106 -s SRR13311153
```



