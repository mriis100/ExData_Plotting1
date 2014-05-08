setwd("C:/Users/Morten Riis/Documents/R/coursera/DataScience/ExData_Plotting1")

Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("NA","?"))
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png(file = "plot2.png", width = 480, height = 480) 
plot(data$Datetime, data$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
