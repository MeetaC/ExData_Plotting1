setwd("C:/Meeta Skill Enhancement/Data Science Specialization/Course 4- Exploratory Data Analysis/Week 1/Project")
dir.create("Data")
dir.exists("./Data")


  
  #Read Table
 
  zipfile <-"Data/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  #unzip file
  unzip(zipfile, exdir="Data")
  
  testdata <- read.table("data/household_power_consumption.txt", sep=";", header= TRUE, na.strings = "?", nrow= 100)
  str(testdata)

  
  install.packages("sqldf")
  library(sqldf)
  df <- read.csv.sql("data/household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
                     , sep=";")
  str(df)
  
  closeAllConnections()
  
  
 
  
  
  #PLOT 1
  
  globalActivePower <- as.numeric(df$Global_active_power)
  png("plot1.png", width=480, height=480)
  hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off() 
  
  
  
  
  
  
  
  
  