library('Rcpp')
library('dada2')

load('EnvironmentDada2.RData')

set.seed(100)

#Minimal bootstrap value of 80% and using RDP training set
taxa.80 <- assignTaxonomy(seqtab.nochim, "/home/s1697714/data/lepb_samples/rdp_db/rdp_train_set_18.fa.gz", minBoot=80)

########                      THIS WAS NOT USED SINCE 0 SPECIES WERE ACTUALLY ASSIGNED                ############
### species level assignment on exact matching: 
##taxa <- addSpecies(taxa, "/home/s1697714/data/lepb_samples/rdp_db/rdp_train_set_18.fa.gz")

### inspect assingments
#taxa.print <- taxa # Removing sequence rownames for display only
#rownames(taxa.print) <- NULL
#head(taxa.print)

save.image('EnvironmentDada2.RData')
