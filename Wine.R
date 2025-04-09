library(tidyverse)

load("WineDataset_Cleaned.RData")

head(wine_data)

hist(wine_data$Price, 
     main = "Price Distribution",
     xlab = "Price (£)",
     col = "lightblue",
     border = "black")

hist(wine_data$ABV, 
     main = "Alcohol (ABV) Distribution",
     xlab = "ABV (%)",
     col = "lightcoral",
     border = "black")

country_counts <- table(wine_data$Country)
barplot(country_counts, 
        main = "Number of Wine per Country", 
        col = "lightgreen",
        xlab = "Country",
        ylab = "Number of Wine",
        las = 2) 

type_counts <- table(wine_data$Type)
barplot(type_counts, 
        main = "Type of Wine Distribution", 
        col = "lightpink",
        xlab = "Type of Wine",
        ylab = "Number")


load("WineDataset_Cleaned.RData")

# distribution of wines
wine_data %>%
  ggplot(aes(x = Price)) + 
  geom_histogram()










