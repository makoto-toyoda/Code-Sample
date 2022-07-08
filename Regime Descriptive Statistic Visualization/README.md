# Description
I analyzed a World Bank data set to observe countries’ political regimes and produced various data visualizations to compare country regimes to their corresponding GDP, population, and aid packages.

# Overview
I first found the frequency of the polity 2 variable by using the tab function. I created a data frame using the political variable from the dataset, “dat.” I renamed polity 2 from its original column title, “Var 1,” to Polity2 by using `names(tab.polity2)[names(tab.polity2) == 'Var1'] <- 'Polity2'`

I made a new variable called ‘tab.polity2$Perc’ and used the print function. In order to transform the variable Polity 2 from a factor to a numeric value, I first changed it to a character with the `as.character` code and then to a numeric value with the `as.numeric` code. 

Next, I created the three categories, “Autocracy,” “Anocracy,” and “Democracy,” by using `tab.polity2$polity2.category` The values that were less than -6 were labeled “Autocracy”, the values between -5 and 5 were labeled “Anocracy”, and the values greater than 6 were labeled “Democracy.” 

I chose political regimes as my ordinal variable and lngdp or logged gross domestic product (GDP) as my continuous variable. I used `library(ggplot2)` to load the ggplot2 package. 

Then, I used `ggplot(data = subset(dat,!is.na(polity2)))` to create a subset that weeds out any missing values for the polity 2 variable. I applied the `geom_bar` code to create a bar chart for my ordinal variable, and then modified the x-axis to be named “Autocracy % to Democracy %.” 

To create a histogram, I used `ggplot(dat, aes(lngdp))` to isolate logged GDP as my continuous variable; subsequently using the `geom_histogram` code to create the chart and `facet_wrap` code to number it as a group of political regime. Finally, I used xlab and ylab code to label the x/y axes and ggtitle to set a title for the histogram. 

Lastly, to create a scatterplot of two continuous variables I first decided to use net amount of aid or wdi_aid, and population or wdi_pop. I used the `ggplot(dat) + geom_point` function to create a simple scatter plot. Within the parentheses, I made sure to identify the x variable as net aid (wdi_aid) and y as population (wdi_pop). 

To observe whether the variables are significantly correlated, I used `geom_smooth(method=lm)` to create a prediction line on the scatterplot. Observing the scatterplot and the prediction line, I can conclude that there is a positive correlation between a country’s population and the amount of net aid they receive. 

I labeled the x/y axes using the xlab and ylab functions, naming x the “Net Development Assistance Given to Country” and y as “Population (WDI)”. I titled the plot “Population (WDI) and Amount of Net Development Assistance Per Country,” using the ggtitle function.
