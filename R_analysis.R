#first R script
library(ggplot2)
library(dplyr)

df <- data.frame(read.csv('data/ViewingActivity.csv'))
filtered_df <- df %>% filter(df$Latest.Bookmark != 'Not latest view')
device_counts <- filtered_df %>% group_by(Device = Device.Type) %>% summarise(count = n()) 
device_counts <- device_counts[order(device_counts$count),]
total_devices <- sum(device_counts$count)
device_counts <- device_counts %>% mutate(pct_total = count/total_devices)
ggplot(device_counts,aes(x=Device)) + geom_bar() + theme(axis.text.x = element_text(angle = 45, hjust = 1))
device_counts %>% glimpse()
