# Chapter 2 : Getting started with ggplot2()
library(ggplot2)
mpg
# Produce a scatter plot displacement vs highway
ggplot(mpg, aes(x= displ, y= hwy)) +
  geom_point()
#Exercise 2.3.1 Ques 1
ggplot(mpg, aes(cty, hwy))+
  geom_point()
#ques 2
ggplot(mpg, aes(model,manufacturer))+
  geom_point()
#ques 3
ggplot(mpg, aes(cty,hwy))+ geom_point()
ggplot(diamonds, aes(carat, price)) + geom_point()
ggplot(economics, aes(date, unemploy))+geom_line()
ggplot(mpg, aes(cty))+geom_histogram()
# assign unique color corresponding to class
ggplot(mpg, aes(displ, cty, color= class))+
  geom_point()
#set aesthetic to a fixed value
ggplot(mpg, aes(displ,hwy))+
  geom_point(aes( color = "blue"))
ggplot(mpg, aes(displ,hwy))+
  geom_point(color = "blue")
#colours available in ggplot2()
vignette("ggplot2-specs")
# Operation with facetting, another way to express categorical variable.
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  facet_wrap(~class)
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  facet_wrap(~cyl)
#adding an smoother to a plot
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth()
# important argument of geom_smooth() is method.
# method allows us which type of model is used to fit
# the wiggliness of the line is controlled by the 'span' parameter ranging from 0(excessively wiggly) to 1(not so wiggly)
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(span=0.2)
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(span=1)
library(mgcv)
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(method= "gam", formula = y~s(x))
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(method= "lm")
library(MASS)
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(method="rlm")
#Histogram and frequency poygons
ggplot(mpg, aes(hwy)) + geom_histogram()
ggplot(mpg, aes(hwy)) + geom_histogram(binwidth = 1)
ggplot(mpg, aes(hwy)) + geom_freqpoly()
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 2.5)
ggplot(mpg, aes(hwy)) + geom_density()
#facetting in histogram and freqency polygon
ggplot(mpg, aes(displ, colour= drv))+
  geom_freqpoly(binwidth=0.5)
ggplot(mpg, aes(displ, colour= drv))+
  geom_freqpoly(binwidth=0.5)
#Time series with line and path plots
ggplot(economics, aes(unemploy/pop, uempmed))+
  geom_path()+
  geom_point()
#modifying the axes
ggplot(mpg, aes(cty,hwy))+
  geom_point()+
  labs(x= "City Driving", y="Highway Driving")
ggplot(economics, aes(unemploy/pop, uempmed))+
  geom_path()+
  geom_point()+
  labs( x="Unemployment Rate", y="Length of Unemployment")
#quick plot
qplot(displ, hwy, data = mpg)
#Chapter 3 Toolbox
df <- data.frame(
  x= c(3,1,5),
  y= c(2,4,6),
  label=  c("a","b", "c")
)
p <- ggplot(df, aes(x,y, label= label))+
  labs(x=NULL, y=NULL) + 
  theme(plot.title = element_text(size=12))
p+ geom_point()+ggtitle("point")
p+ geom_text()+ggtitle("text")
p+ geom_line()+ggtitle("line")
p+ geom_bar()+ggtitle("bar")
p+ geom_tile()+ggtitle("raster")
p+ geom_area()+ggtitle("area")
p+ geom_path()+ggtitle("path")
p+ geom_polygon()+ggtitle("polygon")
#Labels
#adding text to a plot
df <- data.frame(x=1, y= 3:1, family = C("sans", "serif", "mono"))
ggplot(df, aes(x,y))+
  geom_text(aes(label=family, family = family))
#Annotations
ggplot(economics)+
  geom_line(aes(date, unemploy))
#We can annotate the plot with which president was in power at that time'
ggplot(economics)+
  geom_rect(
    aes(xmin = start, xmax= end, fill =party),
    ymin=-Inf, ymax = Inf, alpha =0.2,
    data= presidential)+
  geom_vline(
    aes(xintercept =as.numeric(start)),
    data = presidential,
    colour = "grey50", alpha = 0.5) +
  geom_text(
    aes(x=start, y= 2500, label = name),
    data = presidential,
    size=3, vjust =0, nudge_x = 50) +
  geom_line(aes(date, unemploy))+
  scale_fill_manual(values = c("blue", "red"))
#Chapter 4
# Mastering the Grammer
#Section 4.2 Building a scatter plot, mapping aesthetics to data
ggplot(mpg, aes(displ, hwy, colour= factor(cyl))) + geom_point()
ggplot(mpg, aes(displ,hwy, colour= factor(cyl))) + geom_boxplot()
#combination of multiple geoms
ggplot(mpg, aes(displ, hwy, colour= factor(cyl))) + geom_point()+geom_smooth()
#Scaling
vignette("ggplot2-specs")
#Adding complexity
ggplot(mpg, aes(displ, hwy, colour= factor(cyl))) + geom_point()+geom_smooth()+ facet_wrap(~year)
#Chapter 5 :Build a plot layer by layer
p <- ggplot(mpg, aes(x= displ,y= hwy, colour= class))
p # will not show anything as no layers have been added.
p +geom_point()
#What happens behind the scene ? it calls a layer() functions as follws,
p + layer(
  mapping = NULL,
  data = NULL,
  geom = "point",
  stat= "identity",
  position = "identity"
)
# Specifying the Aesthetics in the vs. in the Layers
ggplot(mpg, aes(x= displ,y= hwy, colour= class))+
  geom_point()
ggplot(mpg, aes(x= displ,y= hwy, colour= class))+
  geom_point()+
  geom_smooth(method = "lm", se= FALSE) +
  theme(legend.position = "none")

ggplot(mpg, aes(x= displ,y= hwy))+
  geom_point(aes(colour= class))+
  geom_smooth(method = "lm", se= FALSE) +
  theme(legend.position = "none")
# setting vs mapping
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(method= "lm")+
  geom_smooth(method="loess")+
  labs(colour= "Method")
#With Aesthetic mapping by Method?
ggplot(mpg, aes(displ,hwy))+
  geom_point()+
  geom_smooth(aes(colour= "lm"),method= "lm")+
  geom_smooth(aes(colour = "loess"), method="loess")+
  labs(colour= "Method")
#Stats -> Statistical Trasformations 
ggplot(diamonds, aes(price))+
  geom_histogram(bindwidth = 500)
ggplot(diamonds, aes(price))+
  geom_histogram(aes(y= ..density..),bindwidth = 500)
#Scales Axes and Legends
ggplot(mpg,aes(displ,hwy))+
  geom_point(aes(colour = class))+
  scale_x_continuous("A really awesome x axis")+
  scale_y_continuous("A really awesome y axis")
