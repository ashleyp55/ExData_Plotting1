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

##Create four plots in 2x2 panel using Base Plotting System
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(febData, {
  plot(Global_active_power ~ DateTime, 
        type = "l", xlab = "", ylab = "Global Active Power", cex = .8)
  plot(Voltage ~ DateTime, type = "l", 
        xlab = "datetime", ylab = "Voltage", cex = .8)
  plot(Sub_metering_1 ~ DateTime, type = "l", 
        xlab = "", ylab = "Energy sub metering", cex = .8)
        lines(Sub_metering_2 ~ DateTime, col = "Red")
        lines(Sub_metering_3 ~ DateTime, col = "Blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)
  plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime", cex = .8)
})

##Export plot to png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()