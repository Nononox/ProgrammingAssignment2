## Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Filter the data
usefulData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Convert data type
D = as.Date(usefulData$Date, format = "%d/%m/%Y")
DANDT <- as.POSIXct(paste(D, usefulData$Time), format="%Y-%m-%d %H:%M:%S")

## Build graphics device
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(usefulData, plot(DANDT, as.numeric(levels(usefulData$Sub_metering_1))[usefulData$Sub_metering_1], type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
lines(DANDT, as.numeric(levels(usefulData$Sub_metering_2))[usefulData$Sub_metering_2], type = "l", col = "red")
lines(DANDT, usefulData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))
dev.off()
