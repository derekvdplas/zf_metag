load('~/EnvironmentDada2_collapsed_species_assign.RData')
library(phyloseq)

#Melt phyloseq object into (readable) dataframe
collapsed_ASV_dataframe <- psmelt(ps)
#Remove columns not necessary for Krona OR for distinguishing samples
collapsed_ASV_dataframe$OTU <- collapsed_ASV_dataframe$Sample <- collapsed_ASV_dataframe$Subject <- NULL

collapsed_ASV_df_clean <- collapsed_ASV_dataframe

#Filter columns Treat and Factor for mutant/wildtype and male/female and make separate datasets for diff combinations
coll_mut_females_df_tag <- filter(collapsed_ASV_df_clean, Treat == 'mut' & Gender == 'female')
coll_mut_males_df_tag <- filter(collapsed_ASV_df_clean, Treat == 'mut' & Gender == 'male')
coll_wt_females_df_tag <- filter(collapsed_ASV_df_clean, Treat == 'wt' & Gender == 'female')
coll_wt_males_df_tag <- filter(collapsed_ASV_df_clean, Treat == 'wt' & Gender == 'male')

#Now remove columns that were used for distinguishing Gender and Treatment
coll_mut_females_df <- coll_mut_females_df_tag[-c(2,3)]
coll_mut_males_df <- coll_mut_males_df_tag[-c(2,3)]
coll_wt_females_df <- coll_wt_females_df_tag[-c(2,3)]
coll_wt_males_df <- coll_wt_males_df_tag[-c(2,3)]

#Write dataframe to tab seperated values file, that is accepted by Krona
write.table(coll_mut_females_df, file='ASV_coll_mut_fem.tsv', quote=FALSE, sep='\t', row.names = FALSE)
write.table(coll_mut_males_df, file='ASV_coll_mut_male.tsv', quote=FALSE, sep='\t', row.names = FALSE)
write.table(coll_wt_females_df, file='ASV_coll_wt_fem.tsv', quote=FALSE, sep='\t', row.names = FALSE)
write.table(coll_wt_males_df, file='ASV_coll_wt_male.tsv', quote=FALSE, sep='\t', row.names = FALSE)
