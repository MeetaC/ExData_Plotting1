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

closeAllConnections()

str(df)




#PLOT 2

df$Global_active_power <- as.numeric(df$Global_active_power)
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

