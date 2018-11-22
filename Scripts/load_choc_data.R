# Rachel K. Riggs and Carrie Cheung, Nov 2018

# This script reads in the data from flavors_of_cacao.csv
# This script takes no arguments.

# Usage: Rscript scripts/load_choc_data.R

input <- "Data/flavors_of_cacao.csv"
output <- "Data/cleaned_choc_data.csv"

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