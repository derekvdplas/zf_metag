library('Rcpp')
library('dada2')

path <- "/home/s1697714/data/lepb_samples/"


# Forward and reverse fastq filenames have format: SAMPLENAME_R1_001.fastq and SAMPLENAME_R2_001.fastq
fnFs <- sort(list.files(path, pattern="_R1_001_JNDGD.filt.fastq", full.names = TRUE))
fnRs <- sort(list.files(path, pattern="_R2_001_JNDGD.filt.fastq", full.names = TRUE))

# Extract sample names, assuming filenames have format: SAMPLENAME_XXX.fastq
sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)


#Plot--- 1:18 for all samples but unreadable if you plot all at same time
#plotQualityProfile(fnFs[1:2])


# Place filtered files in filtered/ subdirectory
filtFs <- file.path(path, "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path(path, "filtered", paste0(sample.names, "_R_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names

#TruncLen determined by eyeballing QualityProfile plots
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(290,255),
              maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE,
              compress=TRUE, multithread=FALSE)


#learning the error rates
errF <- learnErrors(filtFs)
errR <- learnErrors(filtRs)

save.image(file='EnvironmentDada2.RData')

pdf('errF-290.pdf')
plotErrors(errF, nominalQ=TRUE)
dev.off()

pdf('errR-255.pdf')
plotErrors(errR, nominalQ=TRUE)
dev.off()
