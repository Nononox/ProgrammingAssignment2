## Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Filter the data
usefulData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Convert data type
D = as.Date(usefulData$Date, format = "%d/%m/%Y")
DANDT <- as.POSIXct(paste(D, usefulData$Time), format="%Y-%m-%d %H:%M:%S")
GAP <- as.numeric(levels(usefulData$Global_active_power))[usefulData$Global_active_power]

## Build graphics device
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(DANDT, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(DANDT, as.numeric(levels(usefulData$Voltage))[usefulData$Voltage], xlab = "datatime", ylab = "Voltage", type = "l")
with(usefulData, plot(DANDT, as.numeric(levels(usefulData$Sub_metering_1))[usefulData$Sub_metering_1], type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
lines(DANDT, as.numeric(levels(usefulData$Sub_metering_2))[usefulData$Sub_metering_2], type = "l", col = "red")
lines(DANDT, usefulData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")
plot(DANDT, as.numeric(levels(usefulData$Global_reactive_power))[usefulData$Global_reactive_power], xlab = "datatime", ylab = "Voltage", type = "l")
dev.off()
