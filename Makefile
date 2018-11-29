all : data/cleaned_choc_data.csv results/choc_data_viz.png results/summarized_choc_data.csv results/choc_ratings_analysis_viz.png doc/Report.md

data/cleaned_choc_data.csv : src/load_choc_data.R data/flavors_of_cacao.csv
	Rscript src/load_choc_data.R data/flavors_of_cacao.csv data/cleaned_choc_data.csv

results/choc_data_viz.png : src/viz_choc_data.R data/cleaned_choc_data.csv
	Rscript src/viz_choc_data.R data/cleaned_choc_data.csv results/choc_data_viz.png

results/summarized_choc_data.csv : src/analyze_choc_data.R data/cleaned_choc_data.csv
	Rscript src/analyze_choc_data.R data/cleaned_choc_data.csv results/summarized_choc_data.csv

results/choc_ratings_analysis_viz.png : src/analyze_result_choc_data.R data/cleaned_choc_data.csv
	Rscript src/analyze_result_choc_data.R data/cleaned_choc_data.csv results/choc_ratings_analysis_viz.png

doc/Report.md : doc/Report.Rmd data/flavors_of_cacao.csv data/cleaned_choc_data.csv results/choc_data_viz.png results/summarized_choc_data.csv results/choc_ratings_analysis_viz.png
	Rscript -e "rmarkdown::render('doc/Report.Rmd')"

clean :
	rm -f data/cleaned_choc_data.csv
	rm -f results/choc_data_viz.png
	rm -f results/summarized_choc_data.csv
	rm -f results/choc_ratings_analysis_viz.png
	rm -f doc/Report.md doc/Report.html
