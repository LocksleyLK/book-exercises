# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library("dplyr") 
# install.packages("nycflights13")
library(nycflights13)

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
flights <- read.csv("nycflights13", stringsAsFactors = FALSE)
View(flights)

print(nrow(flights))
print(flights[flights$id, ])

summary(flights, stringAsFactors = TRUE)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
delay_while_flying <- mutate(
  flights,
  arr_time - dep_delay
)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights <- arrange(
  flights,
  -delay_while_flying
)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
delay_while_flying <- flights %>%
  mutate(arr_time - dep_delay) %>%
  arrange(-delay_while_flying)

# Make a histogram of the amount of time gained using the `hist()` function
hist(delay_while_flying)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean(delay_while_flying, na.rm = TRUE)

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
sea_flights <- data.frame(gain_in_air)

# On average, did flights to SeaTac gain or loose time?
mean(sea_flights)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
sea <- group_by(sea_flights)
