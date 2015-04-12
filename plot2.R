plot1 <- function() {

## Project 1 for Exploring Data (exdata013) - plot2.R
## Image URL at https://d396qusza40orc.cloudfront.net/exdata/CP1/ExDataCP1Plot1.png
#
## X-axis is time of day (no legend, just day labels)
## Y-axis is Global Active Power (kilowatts)
## Data comes from a subset of https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Date range 01-FEB-2007 to 02-FEB-2007 subsetted to file ./goodData.txt
#
## Graph type is line
## Output is .png format, 480 pixels x 480 pixelssetwd("/home/mark/R/Classwork-In-Progress/ExDat013/Project1/ExData_Plotting1")

fileName <- "./goodData.txt"
workingTable <- read.table(fileName, sep = ";", header = TRUE, na.strings = "?", comment.char = "")
# combinedTimeAndDate <- paste(workingTable$Date, workingTable$Time)
# DNW: workingTable$TimeAndDateCol <- paste(workingTable$Date, workingTable$Time)
# DNW: workingTable$TimeAndDateCol2 = strptime(workingTable$TimeAndDateCol, format = "%d/%m/%y, %I:%M:%S" )
# DNW: workingTable$TimeAndDateCol <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# as.Posixct call works!
workingTable$DateAndTime = as.POSIXct(paste(workingTable$Date, workingTable$Time), format="%d/%m/%Y %H:%M:%S")


# chartTitle is not used in this chart
# xAxisLabel is not used in this chart
yAxisLabel <- "Global Active Power (kilowatts)"


# Generate Graph
plot(workingTable$DateAndTime, workingTable$Global_active_power, type="l", xlab = "", ylab = yAxisLabel)


# Output to file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

}