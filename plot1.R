## plot 1
## Read Data File
## Subset based on specific data range
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

##  Simplify for plot
##  Create Historgram for plot 1 in PNG File
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Close File
dev.off()