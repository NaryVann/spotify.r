
start = as.Date('2021-01-01') 
end = as.Date('2021-12-01')

getSymbols('SPOT', src = 'yahoo', from = start, to = end)
write.zoo(SPOT, 'SPOT.csv', sep = ',')

stocks = as.xts(data.frame(A = SPOT[, 'SPOT.Adjusted']))
spotify_stocks = tidy(stocks) %>%
  ggplot(aes(x = index, y = value)) +
  geom_bar(stat = "identity", fill = "#18d05d") +
  labs(title = "Spotify Stock Price",
       subtitle = "Jan 2021 - Dec 2021",
       xlab = "Date", ylab = "Stock Price")
spotify_stocks
