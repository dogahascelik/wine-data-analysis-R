library(tidyverse)

getwd()  


wine_data <- read.csv("WineDataset.csv", stringsAsFactors = FALSE)

head(wine_data)


wine_data$Price <- gsub("£|per bottle|per case|each", "", wine_data$Price)  # remove texts
wine_data$Price <- as.numeric(wine_data$Price)  # turn them into numbers

# remove uncessary charcters
wine_data$ABV <- gsub("ABV |%", "", wine_data$ABV)  
wine_data$ABV <- as.numeric(wine_data$ABV)  

# chehch NA
colSums(is.na(wine_data))

# fill missing values
wine_data$Price[is.na(wine_data$Price)] <- mean(wine_data$Price, na.rm = TRUE)
wine_data$ABV[is.na(wine_data$ABV)] <- mean(wine_data$ABV, na.rm = TRUE)
wine_data$Region[is.na(wine_data$Region)] <- "Unknown"

# save cleaned data
save(wine_data, file = "WineDataset_Cleaned.RData")

# reupload
load("WineDataset_Cleaned.RData")
head(wine_data)

# to check
str(wine_data)

# check if there is missing
colSums(is.na(wine_data))

# show the results
View(wine_data)





