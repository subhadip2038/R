# Uploading a scanned pdf file and trasforming them in a txt file.
library("tesseract")
library(pdftools)
library(pdftables)
file_for_ocr <- pdf_convert(file.choose(new=FALSE), dpi=600)
file_ocr <- ocr(file_for_ocr) # Alternatively, this code can directly upload the png files with file.choose() argument.
cat(file_ocr, file="D:/Predictive Analytics/R/Optical Character Recognition/null.txt")

#Upload a the above text file to convert the same into a word cloud
library(tm)
text <- readLines(file.choose(new=FALSE))
docs <- Corpus(VectorSource(text))
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, toSpace, "¢")
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, c("and", "the","this"))
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
library(wordcloud)
#Arguments of the word cloud generator function :
#words : the words to be plotted
#freq : their frequencies
#min.freq : words with frequency below min.freq will not be plotted
#max.words : maximum number of words to be plotted
#random.order : plot words in random order. If false, they will be plotted in decreasing frequency
#rot.per : proportion words with 90 degree rotation (vertical text)
#colors : color words from least to most frequent. Use, for example, colors =“black” for single color.
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
#Optional code
#library(ggplot2)
#ggsave("wordcloud.jpg")
