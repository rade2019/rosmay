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
  mutate(gen = str_remove(gen, '\\)')) %>% 
  separate(gen, into = c("gen1", "gen2"), sep = "-") %>% 
  separate('Sample/Name', into =c('sample','name'),sep = '_')
 
  
write_csv(x = datatidy_rosmay,path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.csv')
write_tsv (x = datatidy_rosmay,path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.tsv')
read_csv('/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.tsv')

# read in the file names and produce a table to join


file_names <- list.files(path = '/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome', 
                         full.names = F, pattern = "*.fastq.gz")

df_file_names <- as.data.frame(file_names)
print(df_file_names)
#split the file names as read from Bowen directory
df_split <- separate(df_file_names, col = file_names, into = c('c1','c2','sample_f','name','origin_f','gen','c6','c7','c8','c9','c10','run'), sep='_') %>% 
            separate(gen, into = c("gen1_f", "gen2_f"), sep = "-") %>% 
            mutate(run = str_remove(run,'.fastq.gz'))

init_join <- left_join(df_split,datatidy_rosmay)
init_join %>% unite("gen", c("gen1_f","gen2_f"))

write_tsv(x = df_split, path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/filenames_out.tsv' )






