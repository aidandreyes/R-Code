# PACKAGES AND LIBRARIES
install.packages("dslabs")

library(dslabs)
library(ggplot2)

# --------------------------------------------
# gapminder dataset from dslabs package
str (gapminder) 

# Create a histogram
ggplot(data = gapminder, aes(x = life_expectancy)) +
        geom_histogram(color = "red", bins = 100) +
        labs (title = "Life Expectancy", x = "Years", y = "Count")

# Create a bar plot
gapminder$continent <- as.factor(gapminder$continent)   # start by converting variable into factor
ggplot(data = gapminder, aes(x = continent)) +
  geom_bar(color = "blue") +
  labs(title = "Observations by Continent", x = "Continent", y = "Count")

# Create a box plot
ggplot(gapminder, aes(x = continent, y = life_expectancy)) +
  geom_boxplot() +
  labs(title = "Life Expectancy for Each Continent", x = "Continent", y = "Life Expectancy (Years)")

# Create a heat map
gapminder$life_expectancy_highlow <- ifelse(gapminder$life_expectancy > 70, "high", "low")

freq <- as.data.frame(table(gapminder$year, gapminder$life_expectancy_highlow))  # new data frame to track frequency
names(freq) <- c("Year", "HighLow", "Frequency")
ggplot(freq, aes(x = HighLow, y = Year, fill = Frequency)) +
  geom_tile() +
    scale_fill_gradient(low = "white", high = "red") +
    labs(title = "Life Expectancy by Year", x = "High vs. Low Life Expectancy (70 Years or Greater)")

# Subsetting
gapminder2000 <- gapminder[gapminder$year == 2000, ]

# Create a new scatterplot to track only data from 2000
ggplot(gapminder2000, aes(x = fertility, y = life_expectancy)) +
  geom_point() +
  labs(title = "Relationship between Fertility and Life Expectancy in 2000",
        x = "Fertility (Number of Children per Woman)",
        y = "Life Expectancy")

# New scatterplot, this time with a shape dimension to differentiate each country's continent
ggplot(gapminder2000, aes(x = fertility, y = life_expectancy, shape = continent)) +
  geom_point() +
  labs(title = "Relationship between Fertility and Life Expectancy in 2000",
        x = "Fertility (Number of Children per Woman)",
        y = "Life Expectancy",
        shape = "Continent")

# New scatterplot, this time adding a color dimension to differentiate region and a size dimension for infant mortality
ggplot(gapminder2000, aes(x = fertility, y = life_expectancy, shape = continent, color = region, size = infant_mortality)) +
  geom_point() +
  labs(title = "Relationship between Fertility and Life Expectancy in 2000",
        x = "Fertility (Number of Children per Woman)",
        y = "Life Expectancy",
        shape = "Continent",
        color = "Region",
        size = "Infant Mortality")

# New scatterplot: track life expectancy for each country by year, add a color dimension for continent
ggplot(gapminder, aes(x = year, y = life_expectancy, color = continent, options(repr.plot.width = 20, repr.plot.height = 6))) +
  geom_point() +
  labs(title = "Life Expectancy By Year",
        x = "Year",
        y = "Life Expectancy")

# New box plot: track life expectancy for each country by year
ggplot(gapminder, aes(x = factor(year), y = life_expectancy, options(repr.plot.width = 20, repr.plot.height = 6))) +
  geom_boxplot() +
  labs(title = "Life Expectancy By Year", 
        x = "Year", 
        y = "Life Expectancy")

