
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
  library(sqldf)

  data <- read.csv.sql(csvFileName, sep=";", 
            sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
  
  data
}

#Perform the needed preproccessing - just adds a column with the date and time in a usable format
preprocess <- function(data) {
  data$DateTime = strptime(paste(data$Date, " ", data$Time), format="%d/%m/%Y %H:%M:%S")
  data
}