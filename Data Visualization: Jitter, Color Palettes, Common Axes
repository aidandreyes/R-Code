install.packages("dslabs")
library (dslabs)
library (ggplot2)

# Subset data frame to include only three individual years
gapminder3 <- gapminder[gapminder$year == 1970 | gapminder$year == 1990 | gapminder$year == 2010, ]

# Clean data frame by omitting any NA values
gapminder3 <- na.omit(gapminder3)

# Plot histogram
ggplot(gapminder3, aes(x = log(gdp))) +
  geom_histogram() +
  labs(title = "Countries and GDP",
        x = "GDP",
        y = "Number of Countries")

# New plot to include density
ggplot(gapminder3, aes(x = log(gdp), after_stat(density))) +
  geom_histogram() +
  geom_density() +
    labs(title = "Countries and GDP",
        x = "GDP")

# Multiple plots: use facet_wrap()
ggplot(gapminder3, aes(x = log(gdp), after_stat(density))) +
  geom_histogram() +
  geom_density() +
  facet_wrap(~ year, nrow = 3) +
    labs(title = "Countries and GDP",
        x = "GDP")

# Boxplots, put them in increasing order
ggplot(gapminder3, aes(x = reorder(region, gdp), y = log(gdp)), options(repr.plot.width = 25, repr.plot.height = 8)) +
  geom_boxplot() +
  geom_jitter(width = 0.05, alpha = 0.5) +          # add geom_jitter() to show exact data points 
  labs(title = "GDP of each Region",
        x = "Region",
        y = "GDP")

# New plot, use year as a factor 
ggplot(gapminder3, aes(x = reorder(region, gdp), y = log(gdp), color = factor(year)), options(repr.plot.width = 25, repr.plot.height = 8)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Dark2") +
  labs(title = "GDP of each Region",
        x = "Region",
        y = "GDP",
        fill = "Year")

# LEVEL 4: Scatterplot

ggplot(gapminder3, aes(x = log(gdp), y = life_expectancy, color = continent)) +
  geom_point(size = 5) +
  labs (title = "GDP and Life Expectancy of Countries",
        x = "GDP",
        y = "Life Expectancy (years)")

# New plot using facet_wrap() to show different results for 1970, 1990, 2010
ggplot(gapminder3, aes(x = log(gdp), y = life_expectancy, color = continent)) +
  geom_point(size = 5) +
  facet_wrap(~year) +
  labs (title = "GDP and Life Expectancy of Countries",
        x = "GDP",
        y = "Life Expectancy (years)")

# Use log population as a size dimension: should emphasize the disparities in population sizes among each countries; puts results into perspective
ggplot(gapminder3, aes(x = log(gdp), y = life_expectancy, color = continent, size = log(population))) +
  geom_point() +
  scale_color_brewer(palette = "Dark2") +
  facet_wrap(~year) +
  labs (title = "GDP and Life Expectancy of Countries",
        x = "GDP",
        y = "Life Expectancy (years)")

# North/South American and European countries tended to have the highest population sizes and GDPs.

