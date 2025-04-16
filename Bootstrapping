install.packages("dslabs")
library(dslabs)
library(ggplot2)

# Subset the already installed gapminder data frame to only include 2010 statistics
  gapminder2010 <- gapminder[gapminder$year == "2010", ]
  gapminder2010 <- na.omit(gapminder2010)

# Bootstrapping to create a 95% confidence interval for average life expectancy
  boot <- sample(gapminder2010$life_expectancy, size = 2000, replace = TRUE)
  boot_means <- vector(length = 2000)
  
  for (i in 1:2000){
    boot_samples <-  sample (gapminder2010$life_expectancy, size = 2000, replace = TRUE)
  
    means <- mean (boot_samples)
  
    boot_means[i] <- means
  }
  print(quantile(boot_means, probs = c(0.025, 0.975)))

# Plot all bootstrapped means
    hist(boot_means, breaks = 25,
          main = "Average Life Expectancy",
          xlab = "Life Expectancy (Years)")    # This plot shows the varying means of life expectancy using 2000 samples. 
                                               # The mean of this sampling distribution is approximately 70.5, which is approximately the true population mean of the dataset.

# Bootstrapping to create 95% confidence interval for median life expectancy
    boot_medians <- vector(length = 2000)
    for (i in 1:2000){
      boot_samples <-  sample (gapminder2010$life_expectancy, size = 2000, replace = TRUE)
  
      medians <- median (boot_samples)
    
      boot_medians[i] <- medians
    }
    print(quantile(boot_medians, probs = c(0.025, 0.975)))

# Bootstrapping to create 95% confidence interval for standard deviation
    boot_deviations <- vector(length = 2000)
    
    for (i in 1:2000){
      boot_samples <-  sample (gapminder2010$life_expectancy, size = 2000, replace = TRUE)
    
      deviation <- sd (boot_samples)
    
      boot_deviations [i] <- deviation
    }
    print(quantile(boot_deviations, probs = c(0.025, 0.975)))

# PART 4: Differences in average life expectancy
    africa_mean_expectancy <- mean(gapminder2010[gapminder2010$continent == "Africa", "life_expectancy"])
    
    america_mean_expectancy <- mean(gapminder2010[gapminder2010$continent == "Americas", "life_expectancy"])
    
    asia_mean_expectancy <- mean(gapminder2010[gapminder2010$continent == "Asia", "life_expectancy"])
    
    diff1 <- round(abs(africa_mean_expectancy - america_mean_expectancy),2)
    diff2 <- round(abs(asia_mean_expectancy - america_mean_expectancy),2)

# Bootstrapping to create confidence interval in differences in average life expectancy
    n = 2000
    mean_stat <- vector(length = n)

# Difference between Africa and Americas
    for (i in 1:n){
      # bootstrap sample of size n
      boot_ind  <- sample(1:nrow(gapminder2010), size = n, replace = TRUE)
      boot_samp <- gapminder2010[boot_ind,]
      
      # subset life expectancies for africa
      africa    <- boot_samp[boot_samp$continent == "Africa", "life_expectancy"]
      # subset life expectancies for americas
      americas  <- boot_samp[boot_samp$continent == "Americas", "life_expectancy"]
      
      # compute mean difference of single bootstrap sample
      boot_stat <- mean(americas) - mean(africa)
      
      mean_stat[i] <- boot_stat
    }
    print(quantile(mean_stat, probs=c(0.025,0.975)))
    
# Difference between Asia and Americas
  mean_stat_2 <- vector(length = n)
  
  for (i in 1:n){
        # bootstrap sample of size n
        boot_ind  <- sample(1:nrow(gapminder2010), size = n, replace = TRUE)
        boot_samp <- gapminder2010[boot_ind,]
        
        asia    <- boot_samp[boot_samp$continent == "Asia", "life_expectancy"]
        
        americas  <- boot_samp[boot_samp$continent == "Americas", "life_expectancy"]
        
        boot_stat_2 <- mean(americas) - mean(asia)
        
        mean_stat_2[i] <- boot_stat_2
  }
  print(quantile(mean_stat_2, probs=c(0.025,0.975)))

  # The average life expectancy in the Americas is significantly different than the average life expectancy in Africa because the confidence interval does not contain 0, suggesting countries in the Americas have a significantly higher average life expectancy.
  # The average life expectancy in the Americas is not significantly different than the average life expectancy in Asia because the confidence interval contains 0, indicating there is not much difference.
