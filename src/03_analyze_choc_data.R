# Rachel K. Riggs and Carrie Cheung, Nov 2018

# This script reads in cleaned data produced by 01_load_choc_data.R,
# performs a statisical analysis, and produces a statistical summary table.
# This script takes 2 arguments:
# arg1 is the input file
# arg2 is the output file
# Input filepath specifies location of the cleaned chocolate dataset and 
# Output filepath specifies where to save .csv file of summary statistics.

# Usage: 
# bash Rscript src/03_analyze_choc_data.R data/cleaned_choc_data.csv results/summarized_choc_data.csv


# load libraries
suppressPackageStartupMessages(library(tidyverse))
library(infer)

# Read in input parameters from command line
# input <- "data/cleaned_choc_data.csv"
# output <- "rresults/summarized_choc_data.csv"
args = commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {
  
  # read in data
  data <- read.csv(input)
  
  # group Venezuela and Other countries
  data <- data %>%
    mutate(origin = ifelse(Broad.Bean.Origin == "Venezuela", "Venezuela", "Other"))

  # compute mean Ratings of Venezuela and Other  
  data_summarized <- data %>% 
    group_by(origin) %>% 
    summarize(mean_rating = mean(Rating))

  # define test statistic - calculate delta* from sample
  delta_star <- diff(data_summarized$mean_rating)
  
  # generate simulated data under the model H_0 & calculate test 
  # statistics for each simulated sample
  null_dist_two_means <- data %>%
    specify(formula = Rating ~ origin) %>% 
    hypothesize(null = "independence") %>% 
    generate(reps = 10000, type = "permute") %>% 
    calculate(stat = "diff in means", order = c("Venezuela", "Other"))
  
  # calculate p-value
  pval <- null_dist_two_means %>% 
    get_pvalue(delta_star, direction = "both")
  
  # calculate confidence interval
  ci <- null_dist_two_means %>%  
    get_ci() %>% 
    rename(lower_ci = `2.5%`, upper_ci = `97.5%`)
  
  # create summary table
  delta_star <- tibble(delta_star = delta_star)
  summary_table <- bind_cols(delta_star, ci, pval)
    
  # write summary table
  write.csv(summary_table, file = output)
}

# call main function
main()
