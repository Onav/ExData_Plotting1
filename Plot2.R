# Class: Exploratory Data Analysis
# Project 1
# Plot 2

# Load data, format, and subset
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?') 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Datasub <- subset(Data, Data$Date == "2007-02-01" | Data$Date=="2007-02-02")
Datasub$Time <- paste(Datasub$Date, Datasub$Time, sep=" ")
Datasub$Time <- strptime(Datasub$Time, "%Y-%m-%d %H:%M:%S")

# Create png file and send plot to file
png("plot2.png", width = 480, height = 480)

plot(Datasub$Time, as.numeric(Datasub$Global_active_power), 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
dev.off()