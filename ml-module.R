## Load libraries
library(data.table)   # fast and elegant data frames
library(jsonlite)     # read json
library(geosphere)    # geospatial distances
library(leaflet)      # map/geospatial information visualizations

## Load json and store to a data table
## BE SURE TO EDIT THE FILE PATH to match the location on your computer.
tweets <- as.data.table( fromJSON("C:\\Users\\att002\Documents\\DR2 Misc Ref Materials\\2018 Misc Ref Materials\\20180910 GB Course Naperville\\api_tweet.json") )

## Print some information about the fields
print(summary(tweets))

## Convert longitude and latitude to numbers
tweets[, longitude := as.numeric(longitude)]
tweets[, latitude  := as.numeric(latitude)]

## Try again
print(summary(tweets))

## Also
#print(str(tweets))
#View(head(tweets, 100))

## Now show some of the tweets on map
sampledTweets <- tweets[sample(1:nrow(tweets), 1000)]

leaflet() %>%
  addProviderTiles("Stamen.TonerLite") %>%
  addCircles(lng    = sampledTweets$longitude,
             lat    = sampledTweets$latitude,
             radius = 10, 
             popup  = sampledTweets$text,
             label  = sampledTweets$user_screen_name)

## Create a palette that maps factor levels to colors
pal <- colorFactor(c("steelblue", "red"), domain = c(FALSE, TRUE))

## Use different colors for the tweets made in the night-time
leaflet() %>%
  addProviderTiles("Stamen.TonerLite") %>%
  addCircles(lng    = sampledTweets$longitude,
             lat    = sampledTweets$latitude,
             radius = 100, 
             popup  = sampledTweets$text,
             label  = sampledTweets$user_screen_name,
             color  = pal(hour(sampledTweets$created_at)<5))




















##### UNSUPERVISED LEARNING #####
library(d3heatmap)

## Calculate the distance matrix between points
distMatrix <- distm(sampledTweets[, list(longitude, latitude)],
                    sampledTweets[, list(longitude, latitude)])

## No ordering
d3heatmap(distMatrix[1:100, 1:100], dendrogram = "none", colors = "Blues")

## With ordering
d3heatmap(distMatrix[1:100, 1:100], dendrogram = "both", colors = "Blues")

## Run hierarchical clustering
hclustering <- hclust(as.dist(distMatrix))

## Cut the tree hierarchy tree
clusters <- cutree(hclustering, k=10)

sampledTweets$cluster <- clusters

## Create a palette that maps clusters to colors
pal <- colorFactor(palette = topo.colors(length(unique(sampledTweets$cluster))), domain = unique(sampledTweets$cluster))

## Plot with different color for each cluster
leaflet() %>%
  addProviderTiles("Stamen.TonerLite") %>%
  addCircles(lng    = sampledTweets$longitude,
             lat    = sampledTweets$latitude,
             radius = 100, 
             popup  = sampledTweets$text,
             label  = sampledTweets$user_screen_name,
             color  = pal(sampledTweets$cluster))
