# Chocolate Bar Rating Analysis

### Authors:
Rachel K. Riggs

Carrie Cheung

## Project Overview

Have you ever wondered where the chocolate beans of your favourite chocolate bar came from, and whether that has an effect on how good it tastes?

To investigate this further, we needed some very delicious chocolate data - we used the [chocolate bar ratings dataset from Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings), which contains ratings by chocolate experts on over 1,795 individual chocolate bars. The dataset includes additional information about the chocolate bars, including where the chocolate beans were grown, cocoa percentage, and bean variety.

Here is a snapshot of first few rows in the dataset:

![](imgs/choc_data_head.png)

(A CSV copy of the data from Kaggle can be found in the data folder of this repository.)

Since [Venezuela is one of the largest producers of the Criollo bean, which is considered a delicacy](https://en.wikipedia.org/wiki/Cocoa_bean), we set out to answer the following question using the chocolate bar ratings dataset:

>**Do chocolate bars made from beans grown in Venezuela have a different average rating compared to beans grown elsewhere?**

## Usage

You can reproduce our analysis in one of three ways with the following steps:

### Option #1: With Docker

1. Clone/download this repository and, using the command line, navigate to the root of this project.

2. Run the below command in bash (filling in PATH_ON_YOUR_COMPUTER with the absolute path to the root of this project on your computer):

```
docker run --rm -v PATH_ON_YOUR_COMPUTER:/home/choc_analysis rachelkriggs/dsci_522-chocolate_ratings_analysis make -C '/home/choc_analysis' all
```

3. To clean up the analysis:

```
docker run --rm -v PATH_ON_YOUR_COMPUTER:/home/choc_analysis rachelkriggs/dsci_522-chocolate_ratings_analysis make -C '/home/choc_analysis' clean
```

### Option #2: Without Docker Using Make
_Note that using Make to run our analysis is more straight-forward and therefore recommended compared to option #3 below, which requires running multiple scripts._
1. Clone/download this repository and, using the command line, navigate to the root of this project.

2. Run the below command in bash:

```
make all
```

3. To clean up the analysis:

```
make clean
```

### Option #3: Without Docker Without Make

1. Clone/download this repository and, using the command line, navigate to the root of this project.

2. Run the below command in bash in the order listed:

```
Rscript src/01_load_choc_data.R data/flavors_of_cacao.csv data/cleaned_choc_data.csv
Rscript src/02_viz_choc_data.R data/cleaned_choc_data.csv results/choc_data_viz.png
Rscript src/03_analyze_choc_data.R data/cleaned_choc_data.csv results/summarized_choc_data.csv
Rscript src/04_analyze_result_choc_data.R data/cleaned_choc_data.csv results/choc_ratings_analysis_viz.png
Rscript -e "rmarkdown::render('doc/Report.Rmd')"
```

## Usage Flow Chart

The below flowchart visualizes the order the scripts are run as listed in Usage, along with the input file(s) needed and output file(s) produced at each step.

![](imgs/flowchart.png)

## Report

The report for this analysis can be viewed [here](https://github.com/UBC-MDS/DSCI_522-Chocolate_Ratings_Analysis/blob/master/doc/Report.md).

## Dependencies
- R & R libraries (R version 3.5.1):
    - `tidyverse_1.2.1`
    - `knitr_1.20`
    - `here_0.1`
    - `infer_0.3.1`
    - `dplyr_0.7.7`
    - `ggplot2_3.0.0`
