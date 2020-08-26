### Practice your R skills: Covid-19 cases the USA ###
### Sara Gottlieb-Cohen, StatLab Manager           ###

## Research question:
## Do red and blue states have different levels of Covid-19?
## Have they trended differently over time?

## Defining our variables:
## Red/blue States will be defined based on whether the majority voted for 
## Trump/Clinton in 2016.
## We will look at the total number of Covid-19 cases in states on the most recent day.
## We will also adjust for state populations, estimated in 2019.

# Load packages 

library(tidyverse)

# Load election data 

# codebook: https://github.com/MEDSL/2018-elections-unoffical/blob/master/election-context-2018.md

voting <- read_csv("https://raw.githubusercontent.com/sarago88/redblue_covid/master/1976-2016-president.csv")

str(voting)
head(voting)

# Load covid-19 data

covid <- read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")

str(covid)
head(covid)

# Clean, organize and merge the data #

# We care only about votes that went for Trump or Clinton.
# There is also something funky going on in New York state.

# Create "voting_small," a data frame that includes only year, state, fips, 
# candidate and candidate votes. Filter for 2016 and only Trump and Clinton.
# Use group_by and summarize to summarize across the multiple rows for NY.






# Filter the covid data set to include data ONLY on the most recent day.
# Or, filter by a date of your choosing if you are analyzing this far
# in the future.




# Join the recent covid data with the voting data.
# Also add a column to joined data that identifies whether the state went Trump/Clinton,
# based on who got more votes.






# Check to make sure the number of states for each is correct:

summary(as.factor(joined_data$party))

# On the most recent day, which party had more cases?

tapply(joined_data$cases, joined_data$party, sum)

# Is it a significant difference in cases? Use a t-test to find out.


# Did percent voting for Trump predict cases? Perform a linear 
# regression to find out.




## But we ignored population! 
## Now we will add a data set that includes state populations.

population <- read_csv("https://raw.githubusercontent.com/sarago88/redblue_covid/master/nst-est2019-alldata.csv")

head(population)
str(population)

# Select only the population estimate from 2019, and rename "NAME" to "state"
# so we can join it with the other data frames.





# Join population with the data frame that includes political leaning.




# Now let's control for population in our linear model...




# Let's model the data over time, and look at how trends differ in red vs. blue states.
# We also want to look at new cases each day (a more typical "curve"), and not
# total cases since the pandemic began.

# First let's create a "new_cases" variable in the covid data frame.
# Hint: the "lag" command will be helpful here.





# The add voting information to the "over time" data frame, as well as 
# population information. Then we can create a variable called "percent_infected."

# We eventually want to plot the number of NEW infections on each day, but 
# presented as a percent of the population. 
# We will also plot separate lines for red and blue states.





# Plot the data! Date on the x axis, av_infection_rate on y axis, and different
# lines for red vs. blue states.



