#This is a R script for Big Data Assignment.

library(tidyverse)
library(readtext)

#reading in the datafile
datafile <- read_csv('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/R_161128_SHADIL_LIB2500_M002.csv',
                    col_names = TRUE, skip = 14) 
# this is the raw data being cleaned up into a tidy dataframe.
print(datafile)

datatidy_rosmay <- datafile %>%
  separate_('Index', c("index_1", "index_2", 'index_3'), sep = '[ ]') %>%
  glimpse(datatidy_rosmay)
  print(datatidy_rosmay)         

