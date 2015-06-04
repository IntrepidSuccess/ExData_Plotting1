# Exploratory Data Analysis ####
# exdata-015
# Course Project #1
# Due: Sun 7 Jun 6:30 pm CST

# Local copy of instructions available in ./Instructions.R and at ####
# https://class.coursera.org/exdata-015/human_grading/view/courses/
#   973509/assessments/3/submissions

# Plot 4 Overview: ####
#
# Format: 2 x 2 array of plots
# X-axis = [NO GLOBAL X-AXIS LABEL]
# Y-axis = [NO GLOBAL Y-AXIS LABEL]
# Title = [None]

# Attribute labels for plots are with each plotting call: ####

# Get data ####
# Not loving the absolute addressing, but I saved over my data loader function,
# so I had to use this as the short-term (but workable) fix for my system.
# Obviously, to work on another system, the working directory would have to be
# appropriately renamed =(

# startDirectory <- dirname(sys.frame(1)$ofile) # may not need this in final func

      setwd("/home/mark/Dropbox/Classes/COUR_ExploringDataAnalysis/Project1/ExData_Plotting1/")

      masterDataFile <- "../class_files/household_power_consumption.txt"

# Read master data set and process ####
      bigRead <- read.table(masterDataFile,
                            sep = ";",
                            header = TRUE,
                            stringsAsFactors = FALSE,
                            na.strings = "?")

# Subset the target data
      chosenData <- rbind(bigRead[bigRead$Date == "1/2/2007", ],
                          bigRead[bigRead$Date == "2/2/2007", ])

# Recover the memory for the massive dataset
      rm(bigRead)

# Retype data columns of chosenData ####
# Add POSIX time/date column for easy charting

      tempDateTime <- paste(chosenData$Date,
                            chosenData$Time)
      processedDateTime <- as.POSIXct(tempDateTime,
                                      format="%d/%m/%Y %H:%M:%S")
      chosenData <- cbind(processedDateTime,
                          chosenData)

# Retype data columns Global_Active_Power to sub_metering_3 (i.e. the
# last 7 columns) as numeric

      for(index in 4:10) {
            chosenData[,index] <- as.numeric(chosenData[,index])
      }

# Layout plot using layout notes describes at the start of the program comments ####
# Initialize the target output device: ####
png(file = "plot4.png",
    width = 480,
    height = 480)

      # Create a plotting grid two rows by two columns in size:
      par(mfrow = c(2, 2))

# Add first plot...same as the plot for plot2.R, except for x-axis label ####
      # Of course, it needs parameter definitions: ####
      xAxisLabel <- ""
      yAxisLabel <- "Global Active Power"
      mainTitle <- "Global Active Power"
      barColor <- "red"
      plotHeight <- 480
      plotWidth <- 480

      # This generates the actual line plot: ####
      plot(chosenData$processedDateTime, chosenData$Global_active_power,
           type="l",
           xlab = xAxisLabel,
           ylab = yAxisLabel)

      # End of first plot.


# Add second plot. ####
      # Second round of parameter definitions...still going strong!
      xAxisLabel <- "datetime"
      yAxisLabel <- "Voltage"

      # A delightful plot, likes rainy nights and long walks on the beach.
      # Not so much with the pina colada though.

      plot(chosenData$processedDateTime, chosenData$Voltage,
           type = "l",
           xlab = xAxisLabel,
           ylab = yAxisLabel)

# Add third plot. It's the same as the plot for plot2.R ####
      # The parameter definitions to make this sing:####
      xAxisLabel <- ""
      yAxisLabel <- "Energy sub metering"
      lineColor1 <- "black"
      lineColor2 <- "red"
      lineColor3 <- "blue"

      # A monster block of readable code to generate the plot: ####
      # par(bg = NA
      #    xlab = xAxisLabel,
      #    ylab = yAxisLabel)

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

      # Add legend to graph. Personally I like the Legend of Zelda, but
      # I'll stick to what's properly assigned.
      legend("topright",
             col = c(lineColor1, lineColor2, lineColor3),
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty = c(1,1))


# Add four plot. ####
      # The final parameter declarations. That's it, I'm done with these! ####
      xAxisLabel <- "datetime"
      yAxisLabel <- "Voltage"

      # The final plot!
      plot(chosenData$processedDateTime, chosenData$Global_reactive_power,
           type = "l",
           xlab = "datetime",
           ylab = "Global_reactive power")

dev.off() # End of plot generation

