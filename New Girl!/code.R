# favorite group: characters on TV show "New Girl"

# (1) create variable for character names
newgirl.characters <- c("Jess", "Nick", "Schmidt", "Winston", "Cece", "Coach")

# (2) create variable for characters' respective genders
newgirl.genders <- c("Woman", "Man", "Man", "Man", "Woman", "Man")

# (3) dataframe of combined objects
newgirl <- data.frame(newgirl.characters, newgirl.genders)
newgirl10

# (4) add variable summarizing characteristics of each group member to dataframe
newgirl$personality <- c("quirky", "grouchy", "perfectionist", "aloof", "fierce", "sporty")
newgirl

# (5) load package ggplot2
# first install ggplot2
install.packages("ggplot2")
# load ggplot2
library(ggplot2)
 
# (6) generate random variable with 10000 observations with mean = 200, sd = 20
x <- rnorm(10000, mean = 200, sd = 20)
x

# (7) plot random variable as histogram
hist(x)
summary(x)

# plot above random variable using ggplot2() function
help(ggplot2)
??ggplot2
str(x)
qplot(x)

