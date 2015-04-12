plot1 <- function() {

        ## Project 1 for Exploring Data (exdata013) - plot1.R
## Image URL at https://d396qusza40orc.cloudfront.net/exdata/CP1/ExDataCP1Plot1.png
#
## X-axis is Global Active Power (kilowatts)
## Y-axis is Frequency
## Data comes from a subset of https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Date range 01-FEB-2007 to 02-FEB-2007 subsetted to file ./goodData.txt
#
## Graph type is histogram
## Color of bars is Red
## Output is .png format, 480 pixels x 480 pixels

setwd("/home/mark/R/Classwork-In-Progress/ExDat013/Project1/ExData_Plotting1")
fileName <- "./goodData.txt"
workingTable <- read.table(fileName, sep = ";", header = TRUE, na.strings = "?", comment.char = "")

# Graph variables
chartTitle <- "Global Active Power"
xAxisLabel <- "Global Active Power (kilowatts)"
yAxisLabel <- "Frequency"
barColor <- "red"

# Generate graph
hist(workingTable$Global_active_power, main = chartTitle, xlab = xAxisLabel, ylab = yAxisLabel, breaks = 12, xlim = c(0, 6), ylim = c(0, 1200), col = barColor, axes = TRUE)

# Output to file
dev.copy(png, file="plot1.png", width = 480, height = 480) 
dev.off()

}