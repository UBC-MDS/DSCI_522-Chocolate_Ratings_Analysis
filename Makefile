# Makefile
# Rachel K. Riggs & Carrie Cheung, Nov 2018

# This driver script completes a hypothesis test of
# chocolate bar ratings and creates a report.
# This script takes no arguments.

# example usage:
# to run:
# make all
# to clean:
# make clean

all : doc/Report.md

# load in data, clean it, and output clean data
data/cleaned_choc_data.csv : src/01_load_choc_data.R data/flavors_of_cacao.csv
	Rscript src/01_load_choc_data.R data/flavors_of_cacao.csv data/cleaned_choc_data.csv

# exploratory data analysis visualization
results/choc_data_viz.png : src/02_viz_choc_data.R data/cleaned_choc_data.csv
	Rscript src/02_viz_choc_data.R data/cleaned_choc_data.csv results/choc_data_viz.png

# create summary statistics
results/summarized_choc_data.csv : src/03_analyze_choc_data.R data/cleaned_choc_data.csv
	Rscript src/03_analyze_choc_data.R data/cleaned_choc_data.csv results/summarized_choc_data.csv

# run statistical analysis and plot
results/choc_ratings_analysis_viz.png : src/04_analyze_result_choc_data.R data/cleaned_choc_data.csv
	Rscript src/04_analyze_result_choc_data.R data/cleaned_choc_data.csv results/choc_ratings_analysis_viz.png

# write the report
doc/Report.md : doc/Report.Rmd data/flavors_of_cacao.csv data/cleaned_choc_data.csv results/choc_data_viz.png results/summarized_choc_data.csv results/choc_ratings_analysis_viz.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd')"

# clean files
clean :
	rm -f data/cleaned_choc_data.csv
	rm -f results/choc_data_viz.png
	rm -f results/summarized_choc_data.csv
	rm -f results/choc_ratings_analysis_viz.png
	rm -f doc/Report.md doc/Report.html
