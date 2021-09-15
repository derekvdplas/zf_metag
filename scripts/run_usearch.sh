#!/bin/bash

rm -f /home/s1697714/usearch/out/*

cd /home/s1697714/usearch/scripts/

./merge.sh
./filter.sh
./uniques.sh
./otus.sh
./otutable.sh
