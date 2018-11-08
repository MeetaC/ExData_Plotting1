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




#PLOT 3

df$Global_active_power <- as.numeric(df$Global_active_power)
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(df$datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(df$datetime, df$Sub_metering_2, type="l", col="red")
lines(df$datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 
