# Uploading a scanned pdf file and trasforming them in png files
library(tesseract)
library(pdftools)
library(pdftables)
# All page extracted in single txt file
file_for_ocr <- pdf_convert(file.choose(new=FALSE), dpi=600)
file_ocr <- ocr(file_for_ocr)
cat(file_ocr, file="D:/Predictive Analytics/R/Optical Character Recognition/file_extracted.txt", sep="/n")
#Page by page extraction in txt file
page_file_ocr <- ocr(file.choose(new=FALSE))
cat(page_file_ocr, file="D:/Predictive Analytics/R/Optical Character Recognition/pagebypage_file_extracted.txt", sep="/n")
