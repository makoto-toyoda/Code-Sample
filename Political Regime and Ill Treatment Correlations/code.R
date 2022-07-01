# set working directory
getwd()
setwd("/Users/makototoyoda")

# (1) load data
dat <- read.csv("data.csv", header = T)
View(dat)

# (2) descriptive statistics of polity2 & illtreatment variables
library(psych)
summary(dat)
table <- describeBy(dat)
table
# find mode through observing frequency
polity2 <- data.frame(table(dat$polity2))
polity2
illtreatment <- data.frame(table(dat$illtreatment))
illtreatment

# (3) create scatter plot & box plot using polity2 & illtreatment variables
# load ggplot package
library(ggplot2)
# create scatter plot
ggplot(dat, aes(x = polity2, y = illtreatment)) + geom_point()
# prediction line
ggplot(dat, aes(x = polity2, y = illtreatment)) + geom_point() + 
  geom_smooth(method=lm)
# change labels
xlab("Political Regimes")
ylab("Ill Treatment")
ggtitle("Political Regimes and Ill Treatment Levels")
# clean up NAs from polity.category variable
library(psych)
polity.category <- data.frame(table(dat$polity.category))
polity.category
dim(na.omit(polity.category)) # omit NAs
# clean up NAs from illtreatment variable
library(ggplot2)
illtreatment <- data.frame(table(dat$illtreatment))
illtreatment   
dim(na.omit(illtreatment))
# create boxplot
ggplot(subset(dat, !is.na(polity.category)&!is.na(illtreatment)), aes(polity.category, illtreatment), all.outliers=T) + 
  geom_boxplot(notch = F, aes(color=polity.category)) + ylim(0,75)
xlab("Political Regime Category")
ylab("Ill Treatment")
ggtitle("Political Regime Categories and Ill Treatment Levels")

# (5) correlation test between polity.category & illtreatment variables
# install & import readstata13
install.packages("readstata13")
library(readstata13)
# clean up polity2 variable
dim(na.omit(polity2))
# run correlation test
cor.test(dat$polity2, dat$illtreatment, method=c("pearson"))
# p-value = 0.2156 which is greater than 0.05
# cor -0.03662432

# (6) run linear regression & add lngdp, wdi_pop, polity2 variables
m <- lm(polity2 ~ illtreatment + lngdp + wdi_pop, data=dat)
summary(m) 

# (7) run linear regression & remove lngdp
m <- lm(polity2 ~ illtreatment + wdi_pop, data=dat)
summary(m) 





