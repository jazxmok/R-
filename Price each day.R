library(ggplot2)


price_each<- sales_data_sample $PRICEEACH

price_each_hist <- ggplot(data = sales_data_sample, aes(x = price_each)) +
  geom_histogram(fill = "blue", color = "white", 
                 binwidth = 5)+
  labs(x="price each",y="count",title="price each day in hotel")
price_each_hist
