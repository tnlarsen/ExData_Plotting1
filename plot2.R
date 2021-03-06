plot2 <- function(data) {
  
  print("Creating plot2")
  
  dev <- png(filename = "plot2.png", width = 480, height = 480, units = "px")
  
  plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
  
  dev.off()
  
} 

#Note: The code for loading the data is in "main.R"
source("main.R")

data <- preprocess(load())

plot2(data)