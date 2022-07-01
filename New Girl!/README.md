# Description

I chose characters from my favorite television sitcom “New Girl” and created a histogram mapping their gender and personality traits. 

# Code Overview

I first created a variable for the character names. I assigned the value of the variable ‘newgirl.characters’ as a vector containing the characters’ names (Jess, Nick, Schmidt, Winston, Cece, Coach). I used quotations as these variables are strings and not numbers. 
I repeated this process but with the characters’ genders, creating a variable called ‘newgirl.genders’ and assigning a vector containing each character’s gender in a corresponding order with the first variable ‘newgirl.characters”; this meant the first value in ‘newgirl.genders’ (Woman) was the gender of the first value in ‘newgirl.characters’ (Jess), and so on. 
To create a dataframe of the combined, I used the code newgirl <- data.frame(newgirl.characters, newgirl.genders). When I run the code ‘newgirl’, I should then get a dataframe with the first variable (newgirl.characters) as the first column, and the second variable (newgirl.genders) in the second column.
In order to add a variable, I used the code which first notes the existing dataframe (newgirl) and adds a dollar sign to add a new variable (personality). Thus, the code read ‘newgirl$personality’ as the object, and then the function was a vector consisting of the characters’ respective personality traits. When I run this code and then ‘newgirl’ again, the dataframe has three columns, the third one from the left reading ‘personality’ and listing the characteristics I included in the vector. 
Loading package ggplot2 was fairly simple: I first installed ggplot2 using the code ‘install.packages(“ggplot2”)’. Then, to load the package, I utilized the code ‘library(ggplot2)’.
Furthermore, I assigned x as the object and rnorm(10000, mean = 200, sd = 20) for the function. The random data is meant to generate 10000 values, with a mean of 200 and a standard deviation (sd) of 20. 
Lastly, to plot x as a histogram, I simply used the code hist(x), which created a histogram in the lower right hand pane under the tab ‘plots.’ The histogram had a bell-curve, with a mean of 200. 
 
