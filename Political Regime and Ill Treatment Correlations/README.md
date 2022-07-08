# Description
I analyzed a World Bank dataset to compare countries’ political regime to their level of ill-treatment, using data visualizations to observe if there is a correlation.

# Overview
I first used `getwd` to find the working directory and then `setwd` to set the working directory. To load the csv, I created a variable called “dat” for the dataset, and then assigned a vector: `read.csv(“csv”, header = T)` The header = T is included in order to maintain the headers of each category when importing the dataset. In order to check that my data had been properly imported, I used `View(dat)` which brought me to a new file in R with the dataset titled “dat.”

To be able to find more complex descriptive statistics, I imported the psych package by using`library(psych)`. I used `summary(dat)` to get basic descriptive statistics of my dataset such as the median

To find the mean, standard deviation, and skew, I used `table <- describeBy(dat)`, assigning the variable a vector that I can only use once I have installed the psych package. Once I run the code for ‘table,’ I was able to access the standard deviation and skew of every category in my dataset. For the mode, I created a dataframe that would show the frequency of the values for each variable, polity2 and illtreatment. I then found the mode by identifying which value had the highest frequency in each variable.

<img width="581" alt="Screen Shot 2022-07-08 at 5 54 15 PM" src="https://user-images.githubusercontent.com/108553998/178075182-d1946564-9dcb-49dc-9a34-80c4e4cbdd6a.png">

To create a scatter plot and boxplot of polity2 and illtreatment variables, I first loaded the ggplot2 package by using `library(ggplot2)` I used `ggplot(dat, aes(x = polity2, y = illtreatment)) + geom_point()` to create a scatter plot with political regimes as the independent variable, and illtreatment as the dependent variable. 

I then changed the name of the x/y axes to “Political Regimes” and “Ill Treatment” respectively using the code `xlab/ylab`; I created a title for the plot (“Political Regimes and Ill Treatment Levels”) using the code `ggtitle`

To prepare the polity.category variable for the box plot, I cleaned up any NAs in the variable using the `psych` package and found the frequencies of the values as I did in question 2. I then used `dim(na.omit(polity.category))` to omit any NAs present in the polity.category variable. 

I repeated the same process with the illtreatment variable, and used `ggplot(subset(dat, !is.na(polity.category)&!is.na(illtreatment))`, `aes(polity.category, illtreatment), all.outliers=T) + geom_boxplot(notch = F, aes(color=polity.category)) + ylim(0,75)` to create the boxplot. I created the upper limit of 75, as I found that the illtreatment variable had a maximum value of 74. I used the same `xlab`, `ylab`, and `ggtitle` codes to rename the axes and title of the boxplot. 

<img width="592" alt="Screen Shot 2022-07-08 at 5 59 21 PM" src="https://user-images.githubusercontent.com/108553998/178075599-eab8b6df-9e16-48f1-a206-c75e33595723.png">

I used `geom_smooth` to create a prediction line on the scatter plot to see if there was a significant correlation. The line is relatively flat, which indicates that while there seems to be a slight negative linear relationship between polity2 and illtreatment; overall, significant correlation between polity2 scores and illtreatment is not present. As for the box plot, anoncracies have relatively low illtreatment scores through the third quartile, while autocracies have the majority of their illtreatment scores under 20 with some outliers. Democracies have their first to third quartile concentrated in the lower illtreatment scores, but have many “whiskers” or outliers with very high illtreatment scores. This is consistent with the results of the scatter plot, which shows that there is no significant correlation. 

To run a correlation test, I had to install the `readstata13` package using the library function. I cleaned up any NAs from the polity2 variable with the `dim(na.omit(polity2))` function. 

I used the `cor.test(dat$polity2, dat$illtreatment, method=c("pearson"))` code to run the correlation test. The p value was 0.2156, which is greater than 0.05 indicating that the difference is not significant between the two variables. The correlation coefficient was -0.03662432, meaning that the lower ill treatment is, the higher the polity2 score. This means that countries that are democracies (with high polity2 scores) tend to have lower ill treatment.

To run a linear regression, I used `m <- lm(polity2 ~ illtreatment + lngdp + wdi_pop, data=dat)` and added the two variables--lngdp and wdi_pop. I ran the summary of the linear regression using the function `summary(m)` to obtain the descriptive statistics and observe if polity2 has a significant effect on illtreatment. I found that ill treatment, logged GDP (lngdp), and population (wdi_pop) all have a significant effect on the polity2 score; all three variables have three stars which indicate a significance code of 0. The coefficient of illtreatment was -1.046e-01, the coefficient of lngdp was 1.616e+00, and the coefficient of wdi_pop was -6.867e-09. This means that countries with higher polity2 scores tend to have higher illtreatment, logged GDP, and population. 

To run the regression without lngdp, I ran the same code again and removed the `+ lngdp: m <- lm(polity2 ~ illtreatment + wdi_pop data=dat)` This had a change on the result, as neither illtreatment or the wdi_population variables had a significance code. This indicates that in the absence of this variable, ill treatment and population do not have a significant effect on polity2 scores.
