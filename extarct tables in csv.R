#Extracting Tables from PDFs in R using the Tabulizer Package
#Extract table from pdf and writ them in csv files.
library(tabulizer)
library(dplyr)
# table headers get extracted as rows with bad formatting. Dump them.
# Write final table to disk in specified diretory
extract_tables(file.choose(new=FALSE),pages = NULL,output = c("csv"),
               outdir = "D:/Predictive Analytics/R/Optical Character Recognition/")
# Write final table to disk in specified diretory, specify page number
extract_tables(file.choose(new=FALSE),pages = c(8),output = c("csv"),
               outdir = "D:/Predictive Analytics/R/Optical Character Recognition/")
