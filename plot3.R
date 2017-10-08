##R Code to Create plot 3 - a plot of 
##Energy sub metering for Febrary 1st and 2nd, 2007

##Load data just from those two days
##Raw data was saved in my working directory
householdEnergy <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
febData <- householdEnergy[(householdEnergy$Date == "1/2/2007" | householdEnergy$Date == "2/2/2007"), ]

##Format date and time for this plot
febData$Date <- as.Date(febData$Date, format="%d/%m/%Y")
DateTime <- paste(febData$Date, febData$Time)
febData$DateTime <- as.POSIXct(DateTime)

##Create plot using Base Plotting System
with(febData, {plot(Sub_metering_1 ~ DateTime, type = "l", 
                    xlab = "", ylab = "Energy sub metering")
                    lines(Sub_metering_2 ~ DateTime, col = "Red")
                    lines(Sub_metering_3 ~ DateTime, col = "Blue")
})

##Add legend in upper right corner
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Export plot to png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()