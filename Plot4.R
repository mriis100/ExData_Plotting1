setwd("C:/Users/Morten Riis/Documents/R/coursera/DataScience/ExData_Plotting1")

Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("NA","?"))
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png(file = "plot4.png", width = 480, height = 480) 
par(mfrow=c(2,2))

#plot A
plot(data$Datetime, data$Global_active_power, type='l', ylab="Global Active Power", xlab="")

#plot B
plot(data$Datetime, data$Voltage, type='l', ylab="Voltage", xlab="datetime")

#plot C
plot(data$Datetime, data$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1, bty="n")

#plot D
plot(data$Datetime, data$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")

dev.off()
