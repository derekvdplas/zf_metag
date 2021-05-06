#!/bin/bash

metaphlan --install --index mpa_v30_CHOCOPhlAn_201901 --bowtie2db /home/s1697714/metaphlan/

metaphlan /home/s1697714/data/local_host_removed_r1.fastq /home/s1697714/data/local_host_removed_r2.fastq \
--bowtie2db /home/s1697714/metaphlan/ \
--bowtie2out /home/s1697714/metaphlan/metaphlan_zf.bowtie2.bz2 \
--nproc 4 \
--unknown_estimation \
--input_type fastq \
-o /home/s1697714/metaphlan/metaphlan_profiled_zf.txt
