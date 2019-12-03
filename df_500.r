BS <- function(S, K, r, Si, t){
  d1 <- (log(S/K) + (r+(Si^2)/2)*(t))/(Si*sqrt(t))
  d2 <- (log(S/K) + (r-(Si^2)/2)*(t))/(Si*sqrt(t))
  
  
  pnorm(d1)
  pnorm(d2)
  
  call <- S*pnorm(d1) - K*exp(-r*t)*pnorm(d2)
  
  return (call)
}

#TM
#K=500
df <- read.csv("C:/Users/Dhillon/Desktop/j/ASP/data_tm_500.csv")

df1 <- subset(df, select = -c(LTP, No..of.contracts, Turnover.in.Lacs, Premium.Turnover.in.Lacs, Open.Int, Change.in.OI))

df1$CallValue <- NA
df1$Dailyreturn <- NA


k1 = 500
r = 7.396	/ 100
end <- as.Date("28-Mar-2018", "%d-%b-%Y")




df1[1, "Dailyreturn"] <- 0
for(i in 2:nrow(df1)){
  if(df1[i, "Settle.Price"] == 0 || df1[i-1, "Settle.Price"] == 0 ){
    df1[i, "Dailyreturn"] <- 0
  }
  else{
    df1[i, "Dailyreturn"] <- log((df1[i, "Settle.Price"]) / df1[i-1, "Settle.Price"])
  }
}

Si <- sqrt(var(df1[, "Dailyreturn"]))


for(i in 1:nrow(df1)){
  t <-as.numeric(end-as.Date(df1[i,"Date"], "%d-%b-%Y"),units="days")
  vol <- Si*sqrt(t/365)
  df1[i,"CallValue"] <- BS(df1[i, "Underlying.Value"], k1, r, vol, t/365)
}

plot(df1[,"Dailyreturn"], type = "l",col="blue", lwd=2, 
     ylab="Dailyreturn", main = "Daily returns for 42 days")



plot(df1[,"Underlying.Value"], df1[,"CallValue"], type = "l",col="red", lwd=2, 
     xlab="Underlying values", ylab="CallValue",main = "Call values vs Underlying values for k = 500", ylim = c(0, 20))


plot(df1[,"CallValue"], type = "l",col="red", lwd=2, 
     ylab="Call values", main = "Call values for k = 500",ylim=c(0,20))

lines(df1[,"Settle.Price"], type = "l",col="blue", lwd=2, 
      ylab="Settle ", main = "settle")

legend(x=1, y=20, legend=c("BS", "Actual"),
       col=c("red", "blue"), lty=1:2, cex=0.8 )

df1
