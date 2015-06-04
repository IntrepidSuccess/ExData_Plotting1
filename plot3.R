# Exploratory Data Analysis ####
# exdata-015
# Course Project #1
# Due: Sun 7 Jun 6:30 pm CST
#
# Local copy of instructions available in ./Instructions.R and at ####
# https://class.coursera.org/exdata-015/human_grading/view/courses/
#   973509/assessments/3/submissions

# Plot 3 Overview: ####
#
# Format: Line
# X-axis = [Day of the week]
# Y-axis = Energy sub metering
# Title = [none]

# These value are defined here for use in the plotting call: ####
xAxisLabel <- ""
yAxisLabel <- "Energy sub metering"
mainTitle <- ""
lineColor1 <- "black"
lineColor2 <- "red"
lineColor3 <- "blue"
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

# Layout plot using layout notes described at the start of the program comments ####


# Then write to graphic device for output - in this case, .png
png(file = "plot3.png", width = 480, height = 480)
      par(bg = NA
          xlab = xAxisLabel,
          ylab = yAxisLabel)

      # Plot Sub_metering_1 dataset in black
      plot(chosenData$processedDateTime, chosenData$Sub_metering_1,
           type="l",
           col = lineColor1,
           xlab = xAxisLabel,
           ylab = yAxisLabel)

      # Plot Sub_metering_2 dataset in red
      lines(chosenData$processedDateTime, chosenData$Sub_metering_2,
            type="l",
            col = lineColor2,
            xlab = xAxisLabel,
            ylab = yAxisLabel)

      # Plot Sub_metering_3 dataset in blue
      lines(chosenData$processedDateTime, chosenData$Sub_metering_3,
            type="l",
            col = lineColor3,
            xlab = xAxisLabel,
            ylab = yAxisLabel)

      # Add legend to graph
      legend("topright",
             col = c(lineColor1, lineColor2, lineColor3),
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty = c(1,1))

dev.off()
