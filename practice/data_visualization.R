## for reading & writing data
library(here)
library(readxl)
library(readr)
## for data munging
library(dplyr)
library(tidyr)
## for plotting
library(ggplot2)
library(patchwork)
## for model fitting
library(R2jags)

## data directory
data_dir <- here("data")
## original data file
orig_data <- here(data_dir, "Schultz_data_ver2.xlsx")
## worksheets in notebook
sht_names <- excel_sheets(orig_data)
## convert worksheets to csv
if(length(list.files(data_dir, "csv")) == 0) {
  for(i in sht_names) {
    orig_data %>% read_xlsx(sheet = i) %>%
      write_csv(file = here(data_dir, i))
  }
}


## read count data
counts <- read_csv(here(data_dir, "transectcounts.csv"))
colnames(counts)

### Could not finish due to no access to above .csv