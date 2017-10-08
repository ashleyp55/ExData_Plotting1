##R Code to Create plot 1 - a histogram of 
##Global Active Power for Febrary 1st and 2nd, 2007

##Load data just from those two days
##Raw data was saved in my working directory
householdEnergy <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
febData <- householdEnergy[(householdEnergy$Date == "1/2/2007" | householdEnergy$Date == "2/2/2007"), ]

##Create histogram using Base Plotting System
hist(febData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

##Export plot to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()