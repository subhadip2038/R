medical_letter <- pdftools::pdf_convert(file.choose(new=FALSE), dpi=600)
letter_medical <- ocr(medical_letter)
cat(letter_medical, file="D:/Predictive Analytics/R/test.txt")
word_cloud <- scan(file="D:/Predictive Analytics/R/test.txt", what = character())
wordcloud(word_cloud,scale=c(4,.5), min.freq = 5, max.words = Inf,random.order = TRUE, random.color = FALSE, rot.per=.1)
cat(letter_medical)
word_cloud
library(plotly)
m <- highlight_key(mpg)
p <- ggplot(m, aes(displ, hwy)) + geom_point()
gg <- highlight(ggplotly(p), "plotly_selected")
crosstalk::bscols(gg, DT::datatable(m))
# load the plotly R package
library(plotly)

# load the diamonds dataset from the ggplot2 package
data(diamonds, package = "ggplot2")
diamonds
# create three visualizations of the diamonds dataset
plot_ly(diamonds, x = ~cut)
plot_ly(diamonds, x = ~cut, y = ~clarity)
plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")
WO_data1 <- read.csv(file= "D:/Predictive Analytics/Reliability_Analysis_Data_3years.csv")
plot_ly(WO_data1, x= ~ACTLABCOST, y=~ACTMATCOST)
data_wo <- read.csv(file=(file.choose(new=FALSE)))
View(data_wo)
data_wo
as_tibble(data_wo)
View(data_wo_asab)
data_wo_asab <- filter(data_wo, SITEID== "ASAB")
library(dplyr)
View(data_wo_asab)
View(data_wo_asab_cost)