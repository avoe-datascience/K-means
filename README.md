# K-means
Small working example for K-means in R. The package ggplot2 is required for the creation of the graphics. 
``` R
library(ggplot2)
```

### Introduction
K-means is a method used in cluster analysis to partition n observations into k different clusters. This example illustrates the practical use of K-means in R using the `Iris` data set. Normally the dataset should already be loaded into the R-Session and can be viewed with the command:
``` R
iris
```
If this is not the case, the data set can be loaded explicitly in R with the commands:
``` R
library(datasets)
data(iris)
```
### Brief Overview
A short analysis of the data set using the commands str and summary shows that the data set consists of 150 entries, 4 columns with numeric data and one column with the species. We also see that the column species has exactly 3 different characteristics, namely setosa, versicolor and virginica.
``` R
summary(iris)
str(iris)
```

### Find Clusters
If you enter the length and width of the petals in an x-y digram and color the dots according to their species, you will see 3 clusters. The goal of k-means is now to find these 3 clusters, which correspond to the different species, automatically only on the basis of the numerical data. 

``` R
ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col = Species)) + geom_point()
```
