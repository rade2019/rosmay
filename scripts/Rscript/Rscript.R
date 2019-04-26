#This is a R script for Big Data Assignment.

library(tidyverse)
library(readtext)
library(stringi)

#reading in the datafile
datafile <- read_csv('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/R_161128_SHADIL_LIB2500_M002.csv',
                    col_names = TRUE, skip = 14) 
# this is the raw data being cleaned up into a tidy dataframe.
print(datafile)

datatidy_rosmay <- datafile %>%
  separate(Index, into = c("index_1", "index_2","index_3", "index_4", "gen_1", "gen_2"))  %>%
  separate("External ID", c("day_duration", "day_sample"), sep = 1) %>%
  print(datatidy_rosmay)
  glimpse(datatidy_rosmay)
  
  
write_csv(x = datatidy_rosmay, path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay')
