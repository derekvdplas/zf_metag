library('Rcpp')
library('dada2')


load('EnvironmentDada2.RData')

### Sample inference
dadaFs <- dada(filtFs, err=errF, multithread=TRUE)
dadaRs <- dada(filtRs, err=errR, multithread=TRUE)
#Inspecting returned dada-class object
#dadaFs[[1]]

### Merging paired reads
mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE)
### Inspect the merger data.frame from the first sample
#head(mergers[[1]])


save.image('EnvironmentDada2.RData')
