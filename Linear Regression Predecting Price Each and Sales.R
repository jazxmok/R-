library(dplyr)
library(ggplot2)

data_sample <- sample(c(TRUE,FALSE),nrow(sales_data_sample),replace=T,prob=c(0.6,0.4))

train <- sales_data_sample[data_sample,]
test<-sales_data_sample[!data_sample,]

train

model <- lm(PRICEEACH ~ SALES, data=train)
model
