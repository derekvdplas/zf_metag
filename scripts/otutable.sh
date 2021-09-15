#!/bin/bash

#-id is percentage identity, here set to 97%
$usearch -usearch_global /home/s1697714/usearch/out/merged.fq -db /home/s1697714/usearch/out/otus.fa \
 -strand plus -id 0.97 -otutabout /home/s1697714/usearch/out/otutable.txt

### In case of zotus
#$usearch -otutab /home/s1697714/usearch/out/merged.fq \
#-zotus /home/s1697714/usearch/out/zotus.fa \
#-otutabout /home/s1697714/usearch/out/zotutab.txt \
#-mapout /home/s1697714/usearch/out/zmap.txt
