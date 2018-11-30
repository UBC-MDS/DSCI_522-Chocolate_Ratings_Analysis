# Rachel K. Riggs and Carrie Cheung, Nov 2018

# This script reads in the data from flavors_of_cacao.csv, 
# cleans the data, and writes it to a new file.
# This script takes 2 arguments:
# arg1 is the input file
# arg2 is the output file
# Input filepath specifies location of the original chocolate dataset
# Output filepath specifies where to save .csv file of cleaned data

# Usage: 
# bash Rscript src/01_load_choc_data.R data/flavors_of_cacao.csv data/cleaned_choc_data.csv


# load libraries
suppressPackageStartupMessages(library(dplyr))

# Read in input parameters from command line
# input <- "data/flavors_of_cacao.csv"
# output <- "data/cleaned_choc_data.csv"
args = commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {
  
  # read in data
  data <- read.csv(input, stringsAsFactors=FALSE)
  
  # get rid of missing 'Broad.Bean.Origin' values
  data <- data %>%
    filter(nchar(Broad.Bean.Origin) > 2)
  
  # rename first columns, replacing '.' with white spaces
  data <- data %>% 
    rename(Company.Maker.if.known = Company...Maker.if.known.)
  
  # write clean data file
  write.csv(data, file = output)
}

# call main function
main()
