library(ggplot2)

quantity_order_by_client <- sales_data_sample$QUANTITYORDERED

relationship_between_qt_price <- ggplot(sales_data_sample,aes(x=quantity_order_by_client,y=price_each))+geom_bin2d()

relationship_between_qt_price