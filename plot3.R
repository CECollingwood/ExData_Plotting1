library(lubridate)

dataraw <- read.table(file.choose(), sep = ";", header = TRUE)
dataraw$Date <- as.Date(dataraw$Date, format ="%d/%m/%Y")
dataraw$Sub_metering_1 <- as.numeric(as.character(dataraw$Sub_metering_1))
dataraw$Sub_metering_2 <- as.numeric(as.character(dataraw$Sub_metering_2))
dataraw$Sub_metering_3 <- as.numeric(as.character(dataraw$Sub_metering_3))
data <- subset(dataraw, Date >="2007-02-01" & Date <="2007-02-02")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time, format="%d/%m/%Y %H:%M:%S"))

png("Plot3.png")
  plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", width = 480, height = 480,  units = "px") 
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
