library(dplyr)
library(ggplot2)
library(modelr)

data_sample <- sample(c(TRUE,FALSE),nrow(sales_data_sample),replace=T,prob=c(0.6,0.4))

train <- sales_data_sample[data_sample,]
test<-sales_data_sample[!data_sample,]

train

model <- lm(PRICEEACH ~ SALES, data=train)

avg_rse <- sigma(model)/mean(train$SALES)


r_sq<-summary(model)$r.squared

train$estimate <- predict(model)   
train$residuals <- residuals(model)

plot <- train %>%
  ggplot(aes(SALES, PRICEEACH)) +
  geom_point(aes(size = abs(residuals))) +
  geom_point(aes(y = estimate), color = "blue") +
  geom_segment(aes(xend = SALES, yend = PRICEEACH), color = "gray")
plot+geom_smooth(method="lm")+geom_smooth(se=FALSE,color="red")

summary(model)

sales_coefficient <- model$coefficients[2]

sprintf("Based on a simple regression of `PRICEEACH` by 'SALES', we estimate that for every additional sales, the price each item increases by %s.", sales_coefficient)

intercept_coefficient <- "c"

mse_sales <- test %>%
  add_predictions(model)%>%
  summarise(MSE=mean((SALES-pred)^2))

mse_price<- test%>%
  add_predictions((model))%>%
  summarise(MSE=mean((PRICEEACH-pred)^2))

mse_sales
mse_price

plot <- test %>% 
  add_predictions(model) %>%
  ggplot(aes(PRICEEACH, SALES)) +geom_point()+
  geom_point(aes(y=pred),color="blue") 

plot