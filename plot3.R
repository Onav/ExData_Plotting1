# Class: Exploratory Data Analysis
# Project 1
# Plot 3

# Load data, format, and subset
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?') 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Datasub <- subset(Data, Data$Date == "2007-02-01" | Data$Date=="2007-02-02")
Datasub$Time <- paste(Datasub$Date, Datasub$Time, sep=" ")
Datasub$Time <- strptime(Datasub$Time, "%Y-%m-%d %H:%M:%S")

# Create png file and send plot to file
png("plot3.png", width = 480, height = 480)

plot(Datasub$Time, as.numeric(Datasub$Sub_metering_1), 
     main="",
     xlab = "",
     ylab = "Energy sub metering",
     pch=NA)
lines(Datasub$Time, as.numeric(Datasub$Sub_metering_1), col="black")
lines(Datasub$Time, as.numeric(Datasub$Sub_metering_2), col="red")
lines(Datasub$Time, as.numeric(Datasub$Sub_metering_3), col="blue")
legend("topright", 
       col=c("black","red","blue"), 
       lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()