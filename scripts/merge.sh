#!/bin/bash

#Change dir to directory of samples
cd /home/s1697714/data/lepb_int_samples/pool_treat/

$usearch -fastq_mergepairs *_R1*.fastq -relabel @ \
 -fastq_maxdiffs 10 -fastq_pctid 10 \
 -fastqout /home/s1697714/usearch/out/merged.fq
