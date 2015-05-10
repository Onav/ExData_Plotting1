# Class: Exploratory Data Analysis
# Project 1
# Plot 1

# Load data, format, and subset
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Datasub <- subset(Data, Data$Date == "2007-02-01" | Data$Date=="2007-02-02")

# Create png file and send plot to file
png("plot1.png", width = 480, height = 480)
hist(as.numeric(Datasub$Global_active_power),
     main="Global Active Power",
     col="red",
     ylim = c(0,1200), 
     xlab = "Global Active Power (kilowatts)")
dev.off()