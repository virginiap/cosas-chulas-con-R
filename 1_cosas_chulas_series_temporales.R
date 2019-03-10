# 1.- Make data in real time ----------------------------------------------

real_time_data <- function(){
  
  Sys.sleep(1)
  
  a_row <- data.frame(date=Sys.time(), data=rnorm(1))
  
  return(a_row)
  
}


real_time_data()









# 2.- Plot data in real time ----------------------------------------------

## Real time plot
i <- 1

while(1){
  
  
  # Get the data
  ifelse(i == 1,
         df <- rbind(real_time_data(), real_time_data()),
         df <- rbind(df, real_time_data())
  )
  
  # Plot
  flush.console()
  
  plot(df$date, df$data, type='l', xlab="Time", ylab="")
  
  i <- i+1
  
  
}



## Window plot
window <- 4
i <- 1

while(1){
  
  # Get the data
  
  ifelse(i == 1,
         df <- rbind(real_time_data(), real_time_data()),
         df <- rbind(df, real_time_data())
  )
  
  df <- tail(df, n=window)
  
  # Plot
  flush.console()
  
  plot(df$date, df$data, type='l', xlab="Time", ylab="", ylim=c(-2, 2))

  print(df)
  
  i <- i+1

  
}







# 3.- Make a year data ----------------------------------------------------

df <- data.frame(ds = seq(as.Date('2018-01-01'), as.Date('2018-12-31'), by = 'd'),
                 y = sin(1:365/200) + rnorm(365)/10)
head(df)
plot(y ~ ds, df, type = "l")



# 4.- Forecast with Prophet -----------------------------------------------
library(Rcpp)
library(prophet)
library(dplyr)

m <- prophet(df)
future <- make_future_dataframe(m, periods = 365)
head(future)
tail(future)
forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
plot(m, forecast)

tail(forecast)
prophet_plot_components(m, forecast)





