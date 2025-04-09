library(tidyverse)

load("WineDataset_Cleaned.RData")

# find top 3 countries
top_countries <- wine_data %>%
  group_by(Country) %>%
  summarise(nb_wines = n()) %>%
  arrange(desc(nb_wines)) %>%
  slice(1:3)  #take first 3 

# most used grapes for those countries
top_grapes <- wine_data %>%
  filter(Country %in% top_countries$Country) %>%  # top 3 countries
  group_by(Country, Grape) %>%
  summarise(nb_wines = n()) %>%
  arrange(Country, desc(nb_wines)) %>%
  group_by(Country) %>%
  slice(1:5)  # take 5 grapes per each

top_grapes %>%
  ggplot(aes(x = nb_wines, y = reorder(Grape, nb_wines), fill = Country)) +
  geom_col(alpha = 0.7) + 
  facet_wrap(~Country, scales = "free") +  
  labs(title = "Most Popular Grapes",
       x = "Number of Wines Produced",
       y = "Type of Grape") +
  theme_classic() +
  theme(plot.title = element_text(face = "bold", size = 16),
        axis.title.x = element_text(face = "bold"),
        legend.position = "none") +
  geom_text(aes(x = nb_wines, label = nb_wines), hjust = 1.4, color = "white", fontface = 3)

