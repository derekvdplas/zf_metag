#!/bin/bash

#max expected error set to 1
$usearch -fastq_filter /home/s1697714/usearch/out/merged.fq -fastq_maxee 1.0 \
 -fastaout /home/s1697714/usearch/out/filtered.fa
