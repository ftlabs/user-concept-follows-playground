library(dplyr, quietly = TRUE)
library(readr, quietly = TRUE)
library(tidyr, quietly = TRUE)

data <- read.csv('results.csv')

print(nrow(data))

data  <- data %>% filter(pref_label_latest != '')

head(data)
print(nrow(data))



