#!/usr/bin/env bash


### Nanopore reads

# for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/nanopore_all_raw/*fastq | cut -f7 -d '/' | cut -f1 -d '.'`
#
#   do
#     ./a.out /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/nanopore_all_raw/${i}.fastq > /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/nanopore_all_raw/${i}_avqs.txt
#
#     Rscript --vanilla makePlots.R /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/nanopore_all_raw/${i}_avqs.txt
#   done

### 200bp paired end
for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/*fq`
  do
    cat ${i} | parallel --pipe -L 4  ./a.out > ${i}_avqs.txt
  done

for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/13482X1*_avqs.txt`
  do
    cat ${i} >> /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/200bp_pe_catavq.txt
  done

Rscript --vanilla makePlots.R /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/200bp_pe_catavq.txt

### 5.2Kb_MP
for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/13482X3*_avqs.txt`
  do
    cat ${i} >> /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/5.2kb_mp_catavq.txt
  done
Rscript --vanilla makePlots.R /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/5.2kb_mp_catavq.txt

### 10Kb_MP
for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/13482X2*_avqs.txt`
  do
    cat ${i} >> /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/10kb_mp_catavq.txt
  done
Rscript --vanilla makePlots.R /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/copy_raw/10kb_mp_catavq.txt



### big mate matepairs
for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/*fastq`

  do
    cat ${i} | parallel --pipe -L 4  ./a.out > ${i}_avqs.txt
  done

### 3kb mate pair
for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/3kb*avqs.txt`
  do
    cat ${i} >> /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/3kb_mp_catavq.txt
  done
Rscript --vanilla makePlots.R /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/3kb_mp_catavq.txt

### 20kb MatePair
for i in `ls /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/20kb*avqs.txt`
  do
    cat ${i} >> /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/20kb_mp_catavq.txt
  done
Rscript --vanilla makePlots.R /Volumes/G-SPEED_Shuttle_TB3/Genome_REFERENCE/G3_FIGURES/20kb_matepair_raw/20kb_mp_catavq.txt
