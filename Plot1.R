library(lubridate)

dataraw <- read.table(file.choose(), sep = ";", header = TRUE)
dataraw$Date <- as.Date(dataraw$Date, format ="%d/%m/%Y")
dataraw$Global_active_power <- as.numeric(as.character(dataraw$Global_active_power))
data <- subset(dataraw, Date >="2007-02-01" & Date <="2007-02-02")

png("plot1.png")
plot1 <- hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red",  width = 480, height = 480,
              units = "px")
dev.off()