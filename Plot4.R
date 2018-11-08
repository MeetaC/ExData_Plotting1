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




#PLOT 4

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)




png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df$datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(df$datetime, df$Sub_metering_2, type="l", col="red")
lines(df$datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 



