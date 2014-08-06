
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName <- "./data/household_power_consumption.zip" 
csvFileName <- "./data/household_power_consumption.txt" 
dataDirName <- "data"

#Download and unzip the file if needed and load the relevant data
load <- function() {
  
  if(!file.exists(dataDirName)) {
    dir.create(dataDirName)
    
    print('Downloading')
    download.file(url = fileUrl, destfile = zipFileName, method = "curl")
    
    print('Unzipping')
    unzip(zipFileName, exdir=dataDirName)
  }
  
  print('Loading')

  data <- read.csv.sql(csvFileName, sep=";", 
            sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
  
  data
}

#Perform the needed preproccessing - just adds a column with the date and time in a usable format
preprocess <- function(data) {
  data$DateTime = strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")
  data
}

#The function to call to get the data read and the plots generated
main <- function() {
   
  library(sqldf)
  source("plot1.R")
  source("plot2.R")
  source("plot3.R")
  source("plot4.R") 
  
  data <- load()
  data <- preprocess(data)

  plot1(data) 
  plot2(data) 
  plot3(data)  
  plot4(data)  
}

main()