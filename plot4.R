# Class: Exploratory Data Analysis
# Project 1
# Plot 4

# Load data, format, and subset
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?') 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Datasub <- subset(Data, Data$Date == "2007-02-01" | Data$Date=="2007-02-02")
Datasub$Time <- paste(Datasub$Date, Datasub$Time, sep=" ")
Datasub$Time <- strptime(Datasub$Time, "%Y-%m-%d %H:%M:%S")

# Create png file and send plot to file
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(Datasub$Time, Datasub$Global_active_power, 
     xlab="", 
     ylab="Global Active Power",
     type="l")

plot(Datasub$Time,Datasub$Voltage,
     xlab ="datetime", 
     ylab = "Voltage", 
     type ="l")

plot(Datasub$Time, as.numeric(Datasub$Sub_metering_1), 
     xlab = "",
     ylab = "Energy sub metering",
     pch = NA)
lines(Datasub$Time, as.numeric(Datasub$Sub_metering_1), col="black")
lines(Datasub$Time, as.numeric(Datasub$Sub_metering_2), col="red")
lines(Datasub$Time, as.numeric(Datasub$Sub_metering_3), col="blue")
legend("topright", 
       col=c("black","red","blue"), 
       lty=1,
       bty = "n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(Datasub$Time, Datasub$Global_reactive_power,
     xlab ="datetime", 
     ylab = "Global_reactive_power", 
     type ="l")

dev.off()