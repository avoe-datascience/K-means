library(ggplot2)

iris

library(datasets)
data(iris)

summary(iris)
str(iris)

ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col = Species)) + geom_point()

set.seed(111)

guess_cluster <- kmeans(iris[, 3:4], centers = 3, nstart = 20)

table(guess_cluster$cluster, iris$Species)