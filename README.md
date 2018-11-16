# DSCI_522-rriggs-ccheung

1. For this project, we chose a public dataset of chocolate bar ratings. The data is available from [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) and a CSV copy has been added to the Data folder in this repository. The code to load this data into R is here:

  https://github.com/UBC-MDS/DSCI_522-rriggs-ccheung/blob/master/Scripts/chocolate.R

2. We will be investigating the inferential question: is the average rating for chocolate bars made from beans grown in Venezuela different from the average rating for chocolate bars made from beans grown in other parts of the world?

3. We will analyze the data by conducting a hypothesis test for the difference between two means. The means are average ratings for chocolate bars for the two groups (grown in Venezuela vs not). As part of this analysis, we will compute the point estimates, sample test statistic, confidence intervals, and the p-value. We will use a simulation approach to generate data under the null hypothesis model.

4. To visualize the results of the analysis, we will show a jitter plot overlaid with error bars for each group. We could alternatively visualize the null hypothesis distribution overlaid with the calculated p-value and confidence intervals. We can summarize the results by showing a table that outlines the confidence intervals and the means for each group.