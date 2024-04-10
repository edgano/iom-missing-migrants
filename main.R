##
# Analysis on the IOM data for the missing migrant project
#
# Author: Edgar Garriga
# Contact: edgano@gmail.com
#
##

# Install package
#install.packages("dplyr")  
#install.packages("ggplot2")

# load the package
library(dplyr)               
library(ggplot2)


df <- read.csv("./data/MissingMigrants-Global-2024-04-10--23_23_37.csv")
headDf <- head(df,n=10)

#repalce NA by 0
df[is.na(df)] <- 0

#get all the routes
allRoutes <- unique(df$Migration.route)

#get the dead cause
allDeadCauses <- unique(df$Cause.of.Death)

#filter data and place into specifics df
filter_Drowning <- filter(df,Cause.of.Death == "Drowning")
filter_RouteCentralMed <- filter(df,Migration.route == "Central Mediterranean")

#histogram to show the distribution of the Source Quality
hist(df$Source.Quality)
hist(filter_Drowning$Source.Quality)
hist(filter_RouteCentralMed$Source.Quality)

#donut plot
#   https://r-graph-gallery.com/128-ring-or-donut-plot.html