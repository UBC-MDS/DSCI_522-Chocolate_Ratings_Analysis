# Dockerfile for DSCI_522-Chocolate_Ratings_Analysis project
# Authors: Carrie Cheung & Rachel Riggs
# Dec 2018

# Use rocker/tidyverse as the base image
FROM rocker/tidyverse

# Then install R package dependencies outside of tidyverse (here, infer)
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    here \
    infer
