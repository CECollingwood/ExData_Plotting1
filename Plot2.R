ibrary(lubridate)

dataraw <- read.table(file.choose(), sep = ";", header = TRUE)
dataraw$Date <- as.Date(dataraw$Date, format ="%d/%m/%Y")
dataraw$Global_active_power <- as.numeric(as.character(dataraw$Global_active_power))
data <- subset(dataraw, Date >="2007-02-01" & Date <="2007-02-02")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time, format="%d/%m/%Y %H:%M:%S"))

png("Plot2.png")
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)"), width = 480, height = 480,
     units = "px")
dev.off()