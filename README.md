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

### Visual Inspection
If you enter the length and width of the petals in an x-y digram and color the dots according to their species, you will see 3 clusters. The goal of k-means is now to find these 3 clusters, which correspond to the different species, automatically only on the basis of the numerical data. 

``` R
ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col = Species)) + geom_point()
```

![Cluster plot](./cluster.png?raw=true "Cluster plot")


### Find Clusters
Since the initial centers at k-means are chosen randomly, it is important to initialize the random generator with a fixed number to get reproducible results.
```R
set.seed(111)
```

Based on the plot created above, we already know that we are looking for 3 clusters. Of course, this approach is no longer applicable for more complex problems, but as a first introduction to the topic k-means quite practicable. With the command `kmeans` we start the cluster search. As input we use the variables Petal.Length and Petal.Width already used in the plot above (`iris[, 3:4]`). Furthermore, we specify that we want to partition the dataset into 3 clusters (`centers = 3`). To make the result of the cluster analysis more stable in relation to the randomly selected starting points, we start the analysis with 20 random sets (`nstart = 20`). 
```R
guess_cluster <- kmeans(iris[, 3:4], centers = 3, nstart = 20)
```

After the analysis has been done we want to determine how many entries have been assigned to the correct species. 
```R
table(guess_cluster$cluster, iris$Species)
```

|Group  |setosa | versicolor |virginica|
| ---   | ---   | ---        | ---     |
| 1     | 50    | 0          |   0     |
| 2     |  0    | 48         |   4     |
| 3     |  0    | 2          |   46    |

All elements that are not on the diagonal show incorrectly classified entries. So we see that only 6 out of 150 data points were wrongly classified. The success rate is therefore 96%.
