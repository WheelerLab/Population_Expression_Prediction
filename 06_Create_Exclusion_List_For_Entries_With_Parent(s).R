##open dplyr
library(dplyr)

##load in relationships file
setwd("/home/wheelerlab1/Data/Stranger_et_al_pop_eQTLs/HapMap3-genotypes/")
relationships <- read.table("relationships_w_pops_121708.txt", header = T)

#pull out individuals with parent(s) also studied
relationships_w_parent <- dplyr::filter(relationships, dad != 0 | mom != 0)
relationships_w_parent_1 <- dplyr::filter(relationships_w_parent, population == "CHB" | population == "GIH" | population =="JPT" | population =="LWK" | population =="MEX" | population =="MKK" | population =="YRI")

#shorten table to only include FID and IID columns
exclude <- dplyr::select(relationships_w_parent_1, FID, IID)

#write out to list
setwd("/home/aly/Populations/")
write.table(exclude, file = "exclusion_list.txt", append = FALSE, quote = FALSE, sep = "\t", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double"), fileEncoding = "")
