library(factoextra)

rm(list=ls())

setwd("C:/Users/att002/Documents/DR2 Misc Ref Materials/2018 Misc Ref Materials/20180910 GB Course Naperville/R Studio")

df <- read.csv("cluster.csv", header=T, sep=",")

# "wss" for total within sum of square 
fviz_nbclust(df, kmeans, method="wss")

k <- kmeans(df, centers=2)
fviz_cluster(k, data=df, main="Clustering")

km.res <- eclust(df, "kmeans", k = 2, nstart = 25, graph = T)
fviz_cluster(km.res, geom = "point", ellipse.type = "norm",
             palette = "jco", ggtheme = theme_minimal())

#df <- data.frame(x=c(0,0,2,3,3), y=c(0,1,3,3,4))
#dist(df, method="manhattan",
#diag = T, upper = T)



library(factoextra)
library(cluster)
library(NbClust)
#
data(iris)
head(iris)
#
iris.scaled <- scale(iris[, -5])
head(iris.scaled)
#
# K-means clustering
set.seed(123)
km.res <- kmeans(iris.scaled, 3, nstart = 25)


#
# lets inspect the output here
kmeans(iris.scaled, 3, nstart = 25)
#
#


# k-means group number of each observation
km.res$cluster
#
# Visualize k-means clusters
fviz_cluster(km.res, data = iris.scaled, geom = "point",
             stand = FALSE, ellipse.type = "norm") + theme_bw()

# The author of the factoextra package, Alboukadel Kassambara, informed me that if you omit the choose.vars argument, the function fviz_cluster transforms the initial set of variables into a new set of variables through principal component analysis (PCA). This dimensionality reduction algorithm operates on the four variables and outputs two new variables (Dim1 and Dim2) that represent the original variables, a projection or "shadow" of the original data set. Each dimension represent a certain amount of the variation (i.e. information) contained in the original data set. In this example, Dim1 and Dim2 represent 73% and 22.9% respectively. When plotted, this lower-dimensional picture can be difficult to interpret. In exploratory data analysis, it is therefore perhaps more useful to purposefully select two variables at a time through the choose.vars argument, and then compare the plots. 

fviz_cluster(object = km.res, data = iris.scaled, geom = "point",
             choose.vars = c("Sepal.Length", "Sepal.Width"), stand = FALSE, 
             ellipse.type = "norm") + theme_bw()














set.seed(1122)

setwd("C:/Users/vkg/OneDrive - Nokia/HOME/vkg/Current Projects/2018/Code")

# x1 <- rnorm(1000, mean=5000, sd=1000)
# y1 <- rnorm(1000, mean=2000, sd=500)
# 
# x2 <- rnorm(200, mean=6000, sd=100)
# y2 <- rnorm(200, mean=5000, sd=500)
# 
# X <- x1
# X <- append(X, x2)
# 
# Y <- y1
# Y <- append(Y, y2)
# df <- data.frame(M1=X, M2=Y, M3=X^2/Y, M4=X*Y)