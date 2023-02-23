# install and load necessary packages

install.packages("ggplot2")
library(ggplot2)

install.packages("magrittr")
library(magrittr)

install.packages("dplyr")
library(dplyr)

hpi = read.csv("state_data.csv")

# top 10 states with highest percent change in HPI over 5 years plus VA and DC
states = c('ID', 'UT', 'AZ', 'FL', 'TN', 'NV', 'ME', 'MT', 'NC', 'WA', 'VA', 'DC')

f_hpi = hpi %>% filter(yr >= 2017 & yr <= 2022, state %in% states)

f_hpi$qtr <- as.character(f_hpi$qtr)
f_hpi$yr <- as.character(f_hpi$yr)

ggplot(f_hpi, aes(x = paste(yr, 'Q', qtr), y = index_nsa, group = state, color = state)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  labs(title = "NSA HPI by State and Quarter (2017-2022)",
       x = "Year",
       y = "HPI (not seasonally adjusted)")