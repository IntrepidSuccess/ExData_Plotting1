# Exploratory Data Analysis ####
# exdata-015
# Course Project #1
# Due: Sun 7 Jun 6:30 pm CST
#
# Local copy of instructions available in ./Instructions.R and at ####
# https://class.coursera.org/exdata-015/human_grading/view/courses/
#   973509/assessments/3/submissions

# Plot 1 Overview: ####
#
# Format: Histogram
# X-axis = Global Active Power (kilowatts)
# Y-axis = Frequency
# Title = Global Active Power
# Style notes: Bars are red.
#
# These value are defined here for use in the plotting call:
xAxisLabel <- "Global Active Power (kilowatts)"
yAxisLabel <- "Frequency"
mainTitle <- "Global Active Power"
barColor <- "red"
plotHeight <- 480
plotWidth <- 480


# Get data ####
# Not loving the absolute addressing, but I saved over my data loader function,
# so I had to use this as the short-term (but workable) fix for my system.
# Obviously, to work on another system, the working directory would have to be
# appropriately renamed =(

# startDirectory <- dirname(sys.frame(1)$ofile) # may not need this in final func

setwd("/home/mark/Dropbox/Classes/COUR_ExploringDataAnalysis/Project1/ExData_Plotting1/")

masterDataFile <- "../class_files/household_power_consumption.txt"

# Read master data set and process ####
bigRead <- read.table(masterDataFile, sep = ";", header = TRUE, stringsAsFactors = FALSE, , na.strings = "?")

# Subset the target data
chosenData <- rbind(bigRead[bigRead$Date == "1/2/2007", ], bigRead[bigRead$Date == "2/2/2007", ])

# Recover the memory for the massive dataset
rm(bigRead)

# Retype data columns of chosenData ####
# Add POSIX time/date column for easy sorting without having to retype $Date and
# $Time

tempDateTime <- paste(chosenData$Date, chosenData$Time)
processedDateTime <- as.POSIXct(tempDateTime, format="%d/%m/%Y %H:%M:%S")
chosenData <- cbind(processedDateTime, chosenData)

# Retype data columns Global_Active_Power to sub_metering_3 (i.e. the
# last 7 columns) as numeric

for(index in 4:10) {
      chosenData[,index] <- as.numeric(chosenData[,index])
}

# Layout plot using layout notes describes at the start of the program comments ####
# Optional code to display to screen device first for quality control:
# hist(chosenData$Global_active_power, xlab = xAxisLabel, ylab = yAxisLabel, main = mainTitle, col = barColor)

# Then write to graphic device for output - in this case, .png
png(file = "plot1.png", width = 480, height = 480)
hist(chosenData$Global_active_power, xlab = xAxisLabel, ylab = yAxisLabel, main = mainTitle, col = barColor)
dev.off()