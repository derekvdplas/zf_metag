#!/bin/bash

#find unique sequences in filtered.fa output them in uniques.fa
$usearch -fastx_uniques /home/s1697714/usearch/out/filtered.fa -fastaout /home/s1697714/usearch/out/uniques.fa \
 -relabel Uniq -sizeout
