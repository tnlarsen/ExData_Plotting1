plot4 <- function(data) {
  
  print("Creating plot4")
  
  dev <- png(filename = "plot4.png", width = 480, height = 480, units = "px")
  
  par(mfrow = c(2, 2))

  with(data, {
    plot(DateTime, Global_active_power, type= "l", xlab = "", ylab="Global Active Power")
    plot(DateTime, Voltage, type= "l", xlab = "datetime", ylab="Voltage")
    
    plot(DateTime, Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_1, type="l", col="black")
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="blue")
    
    legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), bty="n"
           , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    
    plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", ylab="Global_reactive_power")
  })
  
  dev.off()
  
}

#Note: The code for loading the data is in "main.R"
source("main.R")

data <- preprocess(load())

plot4(data)