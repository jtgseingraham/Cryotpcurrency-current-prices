# installing packages
install.packages("httr")
install.packages("jsonlite")

# importing packages/libraries
library(httr)
library(jsonlite)

# declaring all pairs of currency pairs we need
pairs <- c("ETHUSDT", "BTCUSDT", "ROSEUSDT")

# running loop
for (i in 1: 3){
  p <- pairs[i]  # storing pair in p variable by it's index value
  
  # completing url and storing it in url variable
  url = paste0("https://api.binance.com/api/v3/ticker/price?symbol=", p)
  r <- GET(url)  # requesting url data
  res = rawToChar(r$content)  # converting raw content to char format
  data = fromJSON(res)  # converting char to json format
  
  # storing keys and values of json data in separate variables
  pair <- data$symbol
  value <- data$price
  
  # printing output
  print(paste(pair, "price is", value))
}