#This is a R script for Big Data Assignment.
#Create tidy dataframe for metadata csv

#Clear global environment
rm(list = ls())

library(tidyverse)
library(readtext)
library(stringi)
library(stringr)

setwd('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome') 
savePath <- ('/OSM/CBR/AF_DATASCHOOL/output/rosmay')
  
#reading in the datafile
datafile <- read_csv('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/R_161128_SHADIL_LIB2500_M002.csv',
                       col_names = TRUE, skip = 14) 

# this is the raw data being cleaned up into a tidy dataframe.
print(datafile)

  
datatidy_rosmay <- datafile %>%
  separate("External ID", into = c("day_duration", "day_sample"), sep = 1) %>%
  separate(Index, into = c("index_1", "index_2","gen"), sep = " ")  %>%
  mutate(gen = str_remove(gen, '\\(')) %>% 
  mutate(gen = str_remove(gen, '\\)'))
  
  
write_csv(x = datatidy_rosmay,path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.csv')
write_tsv (x = datatidy_rosmay,path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.tsv')
read_csv('/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.tsv')

# read in the file names and produce a table to join

file_names <- list.files(path = '/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome', 
                         full.names = T, pattern = "*.fastq.gz")

fastq_list <- data_frame(filename = file_names) %>% 
  mutate(file_contents = map(filename, ~ read_csv(file.path(getwd(), .),
                                                            


write_tsv(x = file_names, path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/filenames_out.tsv' )






