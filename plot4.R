## plot 4
## Read Data File
## Subset based on specific data range
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                   dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  Simplify for plot
##  Split out Metering
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), 
                     "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##  Create Plots for plot 4 in PNG File
##  Adding legend and colors for each submetering
##  Setting rows and columns to 2 each in order to allow for 4 plots on a page
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

##  Create each plot
plot(datetime, globalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power", cex=0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

plot(datetime, globalReactivePower, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

##  Close File
dev.off()