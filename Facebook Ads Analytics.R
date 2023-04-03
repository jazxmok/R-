library(tidyverse)
data <- KAG_conversion_data
glimpse(data)
unique(data$age)
dataTf <- data
dataTf$age[dataTf$age == '30-34'] <- 32
dataTf$age[dataTf$age == '35-39'] <- 37
dataTf$age[dataTf$age == '40-44'] <- 42
dataTf$age[dataTf$age == '45-49'] <- 47
dataTf$age <- as.integer(dataTf$age)
unique(dataTf$age)
str(dataTf$age)
dataTf$gender[dataTf$gender == 'M'] <- 0
dataTf$gender[dataTf$gender == 'F'] <- 1
dataTf$gender <- as.integer(dataTf$gender)
dataTf <- dataTf %>%
  rename(xyzCampId = xyz_campaign_id, fbCampId = fb_campaign_id, impr = Impressions,
         conv = Total_Conversion, appConv = Approved_Conversion)
glimpse(dataTf)
library(heatmaply)
dataMatNorm <- as.matrix(normalize(dataTf, method = "standardize"))
heatmap(dataMatNorm)
dataTf <- dataTf %>%
  mutate(CTR = ((Clicks / impr) * 100), CPC = Spent / Clicks)
dataTf$CTR <- round(dataTf$CTR, 4)
dataTf$CPC <- round(dataTf$CPC, 2)
glimpse(dataTf)
dataTfTrim <- dataTf %>%
  select(CTR, CPC, appConv, conv, impr, Spent, Clicks)
heatmap(cor(normalize(na.omit(dataTfTrim))))
options(repr.plot.width=4, repr.plot.height=3)
ggplot(dataTf, aes(as.factor(xyzCampId), Spent)) + geom_boxplot() 
ggplot(dataTf, aes(as.factor(xyzCampId), conv)) + geom_boxplot() 
data1178 <- data %>%
  rename(xyzCampId = xyz_campaign_id, fbCampId = fb_campaign_id, impr = Impressions,
         conv = Total_Conversion, appConv = Approved_Conversion) %>%
  filter(xyzCampId == 1178)
glimpse(data1178)
library(DataExplorer)
plot_missing(data1178)
options(repr.plot.width=4, repr.plot.height=4)
plot_bar(data1178)

options(repr.plot.width=8, repr.plot.height=4)
plot_histogram(data1178)
