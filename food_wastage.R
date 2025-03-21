install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
setwd("D:/r_projects_new/kaggle_datasets/global_food_wastage")
food_df <- read.csv("global_food_wastage_dataset.csv")
head(food_df)
glimpse(food_df)
View(food_df)
highest_food_wastage <- food_df %>% 
  group_by(Country) %>% 
  filter(Total.Waste..Tons. == max(Total.Waste..Tons.)) %>% 
  select(Country ,Food.Category, Total.Waste..Tons.)
print(highest_food_wastage)  
write.csv(highest_food_wastage, "global_food_waste.csv", row.names = FALSE)
install.packages("ggplot2")
library(ggplot2)
ggplot(highest_food_wastage, aes(x= reorder(Country, Total.Waste..Tons.)
                                 ,y= Total.Waste..Tons. 
                                 ,fill = Food.Category ))+
  geom_bar(stat = "identity")+
  #flipping x and y axis for better readability of countries
  coord_flip() +
  labs(title = "Most food wasted by different countries"
       , x= "Country"
       , y= "Food Wastage"
       , fill = "Food Category")






