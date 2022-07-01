# setting your working directory
setwd("/Users/makototoyoda/Downloads")
getwd()

# import WB dataset
dat <- read.csv("worldbank2.csv", header = T)
View(dat)
# choose variable: gdp

# (1) import csv
setwd("/Users/makototoyoda/Downloads")
data <- read.csv("data.csv", header = T)
View(data)

# (2) import WB dataset 
dat <- read.csv("worldbank2.csv", header = T)
View(dat)
#check top 10 rows of data
head(dat, 10)

# (3) clean up invalid observations from chosen variable (gdp)
# install psych package to get descriptive statistics information
install.packages("psych")
library(psych)
describeBy(dat)
# find frequency of values of my variable (gdp) 
gdp <- data.frame(table(dat$gdp))
gdp
# turn invalid values of gdp variable into NAs
gdp$Var1[gdp$Freq!=1] <- NA
# omit invalid observations now labeled as NA
dim(na.omit(gdp))
 
# (4) table in write up
# observe type of variable
typeof(dat$gdp)
str(dat$gdp)
# observe summary of data isolating variable of choice (gdp)
summary(dat$gdp)
# observe summary of dataset 
summary(dat)

# (5) find country + year that has maximum value of my variable (gdp)
# look at summary of data 
summary(dat$gdp)
# sort dataset by desired variable (gdp)
datsort.gdp <- dat[order(dat$gdp),]
datsort.gdp
# omit NAs from dataset
datsort.gdp <- na.omit(datsort.gdp)
datsort.gdp 
# summary of new isolated dataset
summary(datsort.gdp) #Max GDP = 1.860e+13
# observe maximum value of variable in datsort.gdp
max(datsort.gdp$gdp) #Max GDP = 1.860e+13
# observe top 3 rows
head(datsort.gdp, 3)
# observe to last (1) row 
tail(datsort.gdp, 1) #GDP of United States matches 1.860e+13, thus U.S. has max GDP

# (6) create sub-sample for gdp
# create group/subset from data 
dat.ma <- subset(dat, dat$region=="Middle Africa")
dat.ma
# create subsample 
dat.ma.subsample <- subset(dat.ma, select=c(year, country, gdp))
dat.ma.subsample
# create dataframe of Middle Africa subsample for gdp variable
data.frame(dat.ma.subsample)
# create histogram of subsample
hist(dat.ma.subsample$gdp)

# (7) describe distribution of subsample
summary(dat.ma.subsample)

