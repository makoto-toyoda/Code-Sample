# set working directory
getwd()
setwd("/Users/makototoyoda/Downloads")

# (1) Import Data
dat <- read.csv("data.csv", header = T)
View(dat)
#import psych package
library(psych)
# get descriptive statistics of variables
table <- describeBy(dat)
# create dataframe of descriptive statistics
table <-data.frame(table)
table

# (2) Create Table #1
# find frequency
tab.polity2 <- data.frame(table(dat$polity2))
# remame polity 2 from Var1 to Polity2 in column
names(tab.polity2)[names(tab.polity2) == 'Var1'] <- 'Polity2'
tab.polity2
# find frequency + polity 2
tab.polity2$Perc <- print(round(tab.polity2$Freq / sum(tab.polity2$Freq) * 100,digits=2))
# change variable Polity2 from factor to character
tab.polity2$Polity2 <- as.character(tab.polity2$Polity2)
# change variable Polity2 from character to numeric value
tab.polity2$Polity2 <- as.numeric(tab.polity2$Polity2)
# transform variable Polity2 into categories "Autocracy," "Anocracy," "Democracy"
tab.polity2$polity2.category[tab.polity2$Polity2 <= -6] <- 'Autocracy'
tab.polity2$polity2.category[tab.polity2$Polity2 >= -5 & tab.polity2$Polity2 <= 5] <- 'Anocracy'
tab.polity2$polity2.category[tab.polity2$Polity2 >= 6] <- 'Democracy'
tab.polity2

# (3) Plot ordinal + continuous variable from dataset
# ordinal variable: polity2, continuous variable: lngdp
# load ggplot2 package
library(ggplot2)
# bar chart for ordinal variable (polity2)
ggplot(data= subset(dat,!is.na(polity2)))
geom_bar(aes(polity2), position = 'dodge') 
labs(x=expression(bold('Autocracy' % to % 'Democracy (Polity 2 Score)')))
# histogram for continuous variable (lngdp)
ggplot(dat, aes(lngdp))
geom_histogram(aes(group=dat$lngdp), fill = "white", color = "gray30") +
facet_wrap(~ dat$lngdp) + # by group of political category
# change x-axis and y-axis
xlab("Logged GDP") + # create a label for x-axis 
ylab("Frequency") + ylim(0,200)+   # create a label for y-axis  # set a limit for the range of y-axis from 0 to 200 
# title plot
ggtitle("Logged GDP")  # set a title for the plot

# (4) Scatterplot of two continuous variables
# continuous variables: wdi_aid, wdi_pop 
# create simple scatter plot
ggplot(dat, aes(x = log(wdi_aid), y = wdi_pop)) + geom_point()
# create scatter plot with prediction line to see if variables are significantly correlated
ggplot(dat, aes(x = log(wdi_aid), y = wdi_pop)) + geom_point() +
  geom_smooth(method=lm) #instantly check if there is correlation
# title plot
ggtitle("Population (WDI) and Amount of Net Development Assistance Per Country")
# change x-axis and y-axis
xlab("Net Development Assistance Given to Country") + 
  ylab("Population (WDI)") 



