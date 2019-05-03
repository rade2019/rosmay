This is a README.txt file for the A&F Dataschool big data practical.
The purpose of this file is to list processes and outputs for the Big Data Practical


Objectives and instructions for the practicle are located on the csiro confluence site for Data School
https://confluence.csiro.au/display/DataSchool/Big+Data+Practical

1. Working Together
Directory structure
Scripts are stored in repective home drives on Pearcey
  ssh username@pearcey.hpc.csiro.au
 Raw input data is stored on the Bowen HPC
  file path 
  /OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome  
These are regularly commited to the GITHUB repository called "rosmay' on rade2019
  If you are reading this you are already there
Intermediate output files stored on the Bowen HPC 
 /OSM/CBR/AF_DATASCHOOL/ouput/rosmay/
  2. Metadata
  
  Raw input data is stored on the Bowen HPC
  file path 
  /OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome
    64 fastq.tz files.
      fastq format, is an international standard for storing DNA sequence information. 
      further infromation can be located at https://en.wikipedia.org/wiki/FASTQ_formatfastq
   single CSV file that is the main metadata file 
    R_161128_SHADIL_LIB2500_M002.csv 
     single text file also contianing metadata
      samles.txt
         in the end this file was not required
         
    RScript called RScricpt was used to
      Separate columns to give each vector its own column
      _ was used as a separator
    output as a tsv stored
    /OSM/CBR/AF_DATASCHOOL/ouput/rosmay/datatidy_out.tsv
    List extracted for file names
    List then used to create a dataframe
      Separate columns in dataframe using _ as separator
      output as a tsv stored in
    /OSM/CBR/AF_DATASCHOOL/ouput/rosmay/data_split.tsv
   Tables combined to form new table and superfluous columns removed
   some columns were recombined where the _ separtor had split text that needed to recombine
   output metadata table as tsv in tidy format
   /OSM/CBR/AF_DATASCHOOL/ouput/rosmay/metadata.tsv
   
   Python script used to extract headers from inside the file
   still under development as we hit a few snags.
   
3. Process
4.Align
5.Count
6.Visualisation - challenge
7.Parameter sweep - stretch exercise
8. Presentation



