#importing the data
library(readxl)
airline <- read_excel("C:/Users/Adarsh Sambare/Documents/GitHub/Clustering/EastWestAirlines.xlsx",sheet = "data")
#viewing the data
View(airline)

# Normalizing continuous columns to bring them under same scale
normalized_data <- scale(airline[,2:11])

# distance matrix using euclidean distance method
distance <- dist(normalized_data, method = "euclidean")

# fitting the data to hierarchical clustering by complete method
fitmodel <- hclust(distance, method="complete")

##display dendrogram##
windows()
plot(fitmodel) 
#the plotting is not making sense as no of observation are high

#hagging the dendrogram
plot(fitmodel, hang=-1) 

################################## clustering ##############################
#k means clustering with random k value
kmodel <- kmeans(airline, 5)
str(kmodel)
kmodel$cluster
kmodel$centers

# grouping or numbering the clusters
groups <- kmodel$cluster
#giving them membership
membership<-as.matrix(groups)

# creating a final data set with membership and our data
final <- data.frame(airline, membership)

# saving it in a csv format for reference
write.csv(final, file="final.csv",row.names = F)
getwd()

#clubing them together#
aggregate(airline[,-1],by=list(final$membership),mean)
##giving the passengers name accoundingly
