
plot1 <- function(data) {
  
  print("Creating plot1")
  
  dev <- png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
  
  dev.off()
  
}