#This is a R script for Big Data Assignment.
#Create tidy dataframe for metadata csv

#Clear global environment
rm(list = ls())

library(tidyverse)
library(dplyr)
library(readtext)
library(stringi)
library(stringr)


setwd('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome') 
savePath <- ('/OSM/CBR/AF_DATASCHOOL/output/rosmay')
  
#reading in the metadata csv
datafile <- read_csv('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/R_161128_SHADIL_LIB2500_M002.csv',
                       col_names = TRUE, skip = 14) 

# this is the raw data being cleaned up into a tidy dataframe.

datatidy_rosmay <- datafile %>%
  separate("External ID", into = c("day_duration", "day_sample"), sep = 1) %>%
  separate(Index, into = c("index_1", "index_2","gen"), sep = " ")  %>%
  mutate(gen = str_remove(gen, '\\(')) %>% 
  mutate(gen = str_remove(gen, '\\)')) %>% 
  separate(gen, into = c("gen1", "gen2"), sep = "-") %>% 
  separate('Sample/Name', into =c('sample','name'),sep = '_')
 
  
write_csv(x = datatidy_rosmay,path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.csv')
write_tsv (x = datatidy_rosmay,path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/datatidy_out.tsv')

# read in the file names and produce a table to join to metadata

file_names <- list.files(path = '/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome', 
                         full.names = F, pattern = "*.fastq.gz")

df_file_names <- as.data.frame(file_names)

#split the file names as read from Bowen directory
df_split <- separate(df_file_names, col = file_names, into = c('c1','c2','sample_f','name','origin_f','gen','c6','c7','c8','c9','c10','run'), sep='_') %>% 
            separate(gen, into = c("gen1_f", "gen2_f"), sep = "-") %>% 
            mutate(run = str_remove(run,'.fastq.gz'))

write_tsv(x = df_split, path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/df_split_out.tsv')

init_join <- left_join(df_split,datatidy_rosmay)
init_join$gen = stri_join(init_join$gen1,init_join$gen2, sep = '-')
init_join$sample_ID = stri_join(init_join$sample,init_join$name, sep = '_')
init_join$index = stri_join(init_join$index_1, init_join$index_2, sep = " ")

#select to remove superfluous columns. 
metadata <-select(init_join,sample_ID,run,day_duration,day_sample,Origin,index,gen,'Pool ID','Reference Genome',Application,Progress,'c1','c2','c6','c7','c8','c9','c10')


write_tsv(x = metadata, path = '/OSM/CBR/AF_DATASCHOOL/output/rosmay/metadata.tsv')






