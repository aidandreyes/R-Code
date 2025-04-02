# Install packages & load libraries
  install.packages("dslabs")
  install.packages("readxl")   # imports excel spreadsheets
  install.packages("writexl")  

  library(dslabs)
  library(readxl)
  library(writexl)

# ------------------------------------------------------------------
# Download data
  source("https://raw.githubusercontent.com/khasenst/datasets_teaching/refs/heads/main/salary_parse.R")

# Directories
  setwd("/content/salary_data")
  getwd()
  list.files("/content/salary_data")

# View files in specific folder
  list.files("Data Scientist")

# Load each file
  data <- list()
  for (i in 1:length(file_list)) {
    data[[i]] <-  read.csv(file.path(data_dir, "Data Scientist", file_list[i]), header = TRUE)
  }

# Bind into a data frame
  data_scientists <- do.call(rbind, data)
  
  data_scientists <- as.data.frame(data_scientists)
  head(data_scientists)

# Create a new folder for the newly processed data
  dir.create("/content/processed_data")

# Export as both a txt file and an excel spreadsheet
  write.table(x = data_scientists, 
              file = "/content/processed_data/ds_salaries.txt",
              sep = "\t",
              row.names = FALSE)

  write_xlsx(x = data_scientists,
             path = "/content/processed_data/ds_salaries.xlsx")
