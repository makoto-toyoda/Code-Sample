# Description
I analyzed a World Bank dataset with a focus on GDP as my variable.

# Overview
I first set the working directory by inputting `setwd(“/Users/makototoyoda/Downloads”)`

In order to import the World Bank dataset, I used: 
`dat <- read.csv(“worldbank2.csv”, header = T)`

I used “header = T” so that the imported data would include the headers of each category. I titled the World Bank data “dat”. I used quotations in the code as the dataset title is string.

To import the csv, I repeated the same code I used to import the World Bank data: 
`data <- read.csv(“worldbank2.csv”, header = T)`

I named the imported csv “data” to distinguish it from the World Bank data. To ensure that I correctly imported the data, I used `View(data)`.

I had already imported the World Bank data, but just to make sure, I repeated the code `dat <- read.csv(“worldbank2.csv”, header = T)`

I then used `View(dat)` to verify that it was correctly imported, and checked the top ten rows of data by using `head(dat, 10)` 

To obtain descriptive statistic information from the dataset, I imported the ‘psych’ package by installing it with `install.packages(“psych”)`, and then `library(psych)`

In order to find the invalid values of my chosen variable, GDP, within the dataset, I first had to identify the frequency of the values. I used `gdp <- dataframe(table(dat$gdp))` to isolate my variable, GDP, and named this new data “gdp.” 

Once I ran “gdp,” I found that most of the values’ frequencies were 1. Knowing this information, I used `gdp$Var1[gdp$Freq!=1] <- NA` which converts any values that do not have the frequency of 1 into NA. 

Lastly, I used `dim(na.omit(gdp))` to omit any GDP values that were labeled as NA to clean up the dataset. 

The minimum GDP of my data was 8.824e+06, and the maximum GDP was 1.860e+13. The mean, 1.589e+11, was much higher than the median, 6.710e+09, which indicates that some very wealthy states are dragging up the value of the mean. This is clear when comparing the minimum and maximum GDP, where the minimum GDP is significantly lower than the maximum.

To find the country and year that had the maximum value of my chosen variable GDP, I sorted my data according to this variable. I decided to call this new data datsort.gdp, and used `datsort.gdp <- dat[order(dat$gdp),]` 

Then, I had to omit the NAs from the sorted data; I inputted `datsort.gdp <- na.omit(datsort.gdp)` 

To find the maximum value of GDP itself, I looked at the summary of datsort.gdp, using: `summary(datsort.gdp)` I found that the maximum value was 1.860e+13. I also used the code `max(datasort.gdp$gdp)` and got the same value. 

To find the country and year for highest GDP, I used the code `tail(datsort.gdp, 1)` to look at the bottom 1 row. I found that the country with the highest GDP was the United States in 2016 with a GDP of 1.860e+13, matching the maximum value of my variable. 

To create a subsample for my variable, I first created a subset out of the dataset. I decided to use region, specifically Middle Africa, as my subset and inputted the code `dat.ma <- subset(dat, dat$region== “Middle Africa”)` 

To create the subsample dat.ma.subsample, I used `dat.ma.subsample <- subset(dat.ma, select=c(year, country, gdp))`, which gave me countries within Middle Africa and their respective year, name, and GDP. 

To make a histogram, I first had to create a dataframe using the code `data.frame(dat.ma.subsample)`

Then I used the code `hist(dat.ma.subsample$gdp)`, which produced the histogram.

<img width="357" alt="Screen Shot 2022-07-08 at 5 18 53 PM" src="https://user-images.githubusercontent.com/108553998/178071721-d111cfb4-17a8-44e9-8e86-19e859eff686.png">

As seen in the histogram, the distribution of GDP in Middle African countries skews highly to the left, indicating that most instances of GDP in Middle African nations is low. The higher the GDP value increases, the fewer Middle African country cases there are, as seen by the decreased bars. There are little to no cases where GDP is greater than 4.0e+10. The mean GDP value of this subsample is 8.280e+09, while the median is 1.745e+09. Much like GDP overall, mean in this instance is significantly higher than the median which indicates that a small number of Middle African states are dragging up the mean GDP of this region. 
The minimum GDP of my data was 8.824e+06, and the maximum GDP was 1.860e+13. The mean, 1.589e+11, was much higher than the median, 6.710e+09, which indicates that some very wealthy states are dragging up the value of the mean. This is clear when comparing the minimum and maximum GDP, where the minimum GDP is significantly lower than the maximum.
