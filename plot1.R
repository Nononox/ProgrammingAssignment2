## Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Filter the data
usefulData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Build graphics device
png(file = "plot1.png", width = 480, height = 480, units = "px")
with(usefulData, hist(as.numeric(levels(usefulData$Global_active_power))[usefulData$Global_active_power], xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red"))
dev.off()
