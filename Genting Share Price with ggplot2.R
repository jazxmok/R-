library(readxl)
X3182_KL <- read_excel("C:/Users/weije/Desktop/3182.KL.xlsx")

genting <- X3182_KL 

genting_opening <- genting["Open"]
genting_close <- genting["Close"]
genting_date <- genting["Date"]
genting_low <- genting["Low"]

genting_low <- genting$Low[!is.na(genting$Low)]
genting_date <- genting$Date[!is.na(genting$Low)]

plot(genting_date, genting_low, type = "l", col = "blue", 
     xlab = "Date", ylab = "Price", 
     main = "Genting Low Prices")



