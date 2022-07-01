# set working directory
getwd()
setwd("/Users/makototoyoda")

# descriptive statistics of GINI Coefficient + Capital Share variables
library(psych)
dat <- updated_data
summary(dat)
table <- describeBy(dat)
table
# find mode through observing frequency
gini <- data.frame(table(dat$gini_coefficient))
gini
cap.share <- data.frame(table(updated.data$capital_share))
cap.share
dat


# bar chart for ordinal variable (polity2)
# load ggplot2 package
library(ggplot2)
# clean NAs
gini <- data.frame(table(dat$`gini coefficient`))
gini
dim(na.omit(gini))
cap.share <- data.frame(table(dat$`capital share`))
cap.share
dim(na.omit(cap.share))
# rename variables
gini <- dat$`gini coefficient`
cap.share <- dat$`capital share`
df1 <- data.frame(cap.share, gini)
df1
bp <- ggplot(dat,aes(x = cap.share, y = gini)) + geom_bar(stat="sum", fill = "red", color = "blue") + xlab("Capital Share") + ylab("GINI Coefficient") + ggtitle("Capital Shares and Income Inequality Bar Plot")
bp                                                                                     

# scatterplot
ggplot(dat, aes(x = cap.share, y = gini)) + geom_point() + xlab("Capital Share") + ylab("GINI Coefficient") + ggtitle("Capital Shares and Income Inequality Scatterplot")
# prediction line
ggplot(dat, aes(x = cap.share, y = gini)) + geom_point() + geom_smooth(method=lm) + xlab("Capital Share") + ylab("GINI Coefficient") + ggtitle("Capital Shares and Income Inequality Scatterplot")

# correlation test between cap.share & gini variables
# install & import readstata13
install.packages("readstata13")
library(readstata13)
# run correlation test
cor.test(dat$`capital share`, dat$`gini coefficient`, method=c("pearson"))
# p-value = 0.4555 which is greater than 0.05
# cor 0.2515671 
# 95 percent confidence interval:
  -0.4102126  0.7397998


