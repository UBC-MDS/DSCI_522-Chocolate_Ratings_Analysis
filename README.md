# DSCI_522-rriggs-ccheung

1. For this project, we chose a public dataset of chocolate bar ratings. The data is available from [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) and a CSV copy has been added to the Data folder in this repository. The code to load this data into R is here:

  https://github.com/UBC-MDS/DSCI_522-rriggs-ccheung/blob/master/Scripts/chocolate.R

2. We will be investigating the inferential question: is the average rating for chocolate bars made from beans grown in Venezuela different from the average rating for chocolate bars made from beans grown in other parts of the world?

3. We will analyze the data by conducting a hypothesis test for the difference between two means. The means are average ratings for chocolate bars for the two groups (grown in Venezuela vs not). As part of this analysis, we will compute the point estimates, sample test statistic, confidence intervals, and the p-value. We will use a simulation approach to generate data under the null hypothesis model.

4. To visualize the results of the analysis, we will show a jitter plot overlaid with error bars for each group. We could alternatively visualize the null hypothesis distribution overlaid with the calculated p-value and confidence intervals. We can summarize the results by showing a table that outlines the confidence intervals and the means for each group.

## Chocolate Bar Rating Analysis

#### Project Overview
This project uses the [chocolate bar rating dataset from Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) to investigate the question: Do chocolate bars made from beans grown in Venezuela have a different average rating score than beans grown elsewhere?

This question is motivated by ...

#### Data
 _more about data here_

A CSV copy of the data from Kaggle can be found in the Data folder of this repository.

#### Usage
_Explain how to run your data analysis (which order scripts are run in, what expected inputs are)_

1. Clone this repo, and using the command line, navigate to the root of this project.

2. Run the following commands in the order shown:

```
Rscript src/load_choc_data.R data/flavors_of_cacao.csv data/cleaned_choc_data.csv
Rscript src/viz_choc_data.R data/cleaned_choc_data.csv results/choc_data_viz.png
Rscript src/analyze_choc_data.R data/cleaned_choc_data.csv results/summarized_choc_data.csv
```

#### Dependency Diagram
_Include a flow chart/dependecy diagram_

#### Dependencies
- R & R libraries:
    - `tidyverse`
    - `rmarkdown`
    - `knitr`
