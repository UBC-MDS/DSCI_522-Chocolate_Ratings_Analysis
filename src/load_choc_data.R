# Rachel K. Riggs and Carrie Cheung, Nov 2018
#
# This script reads in the data from flavors_of_cacao.csv
# This script takes 2 arguments, input and output.

# Usage: Rscript src/load_choc_data.R data/flavors_of_cacao.csv data/cleaned_choc_data.csv

# load libraries
suppressPackageStartupMessages(library(dplyr))

# Read in input parameters from command line
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
  
  # write clean data file
  write.csv(data, file = output)
}

# call main function
main()