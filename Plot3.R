setwd("C:/Users/Morten Riis/Documents/R/coursera/DataScience/ExData_Plotting1")

Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("NA","?"))
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png(file = "plot3.png", width = 480, height = 480) 
plot(data$Datetime, data$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1)
dev.off()
