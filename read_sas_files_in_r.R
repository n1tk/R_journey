install.packages("haven")
library(haven)
url <- "/Users/sbuciuma/Desktop/sas2/disease_labor_census65_v3.sas7bdat"
data <- read_sas(url)
data

library(dplyr)
x <- c(2, 3, 234, 5, 4, 500)
data <- data.frame(x, "test")
data
data %>%
  mutate(freq = x / 100)
