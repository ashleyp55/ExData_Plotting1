##R Code to Create plot 2 - a plot of 
##Global Active Power for Febrary 1st and 2nd, 2007

##Load data just from those two days
##Raw data was saved in my working directory
householdEnergy <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
febData <- householdEnergy[(householdEnergy$Date == "1/2/2007" | householdEnergy$Date == "2/2/2007"), ]

##Format date and time for this plot
febData$Date <- as.Date(febData$Date, format="%d/%m/%Y")
DateTime <- paste(febData$Date, febData$Time)
febData$DateTime <- as.POSIXct(DateTime)

##Create plot using Base Plotting System
plot(febData$Global_active_power ~ febData$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Export plot to png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()