plot1 <- function(data) {
  
  print("Creating plot1")
  
  dev <- png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
  
  dev.off()
  
} 

#Note: The code for loading the data is in "main.R"
source("main.R")

data <- preprocess(load())

plot1(data)