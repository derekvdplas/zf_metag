#!/bin/bash

#set usearch binary file to 'usearch' environment variable
export usearch=/home/s1697714/usearch/usearch11.0.667_i86linux32


$usearch -cluster_otus /home/s1697714/usearch/out/uniques.fa -minsize 2 \
 -otus /home/s1697714/usearch/out/otus.fa -relabel Otu

###Alternatively, one could run unoise3 to receive zotu's as opposed to otu's -- more on usearch website https://www.drive5.com/usearch/
#$usearch -unoise3 /home/s1697714/usearch/out/uniques.fa \
# -zotus /home/s1697714/usearch/out/zotus.fa \
# -tabbedout /home/s1697714/usearch/out/unoise3.txt
