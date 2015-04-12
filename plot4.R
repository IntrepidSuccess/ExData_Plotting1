plot4 <- function() {
        
        ## Project 1 for Exploring Data (exdata013) - plot4.R
        ## Image URL at https://d396qusza40orc.cloudfront.net/exdata/CP1/ExDataCP1Plot1.png
        #
        ## Layout is 2 x 2 Graphs
        ## (1,1) Y-axis is Global Active Power
        ## (1,2) X-axis is datetime, Y-axis is Voltage
        ## (2,1) Y-axis is Energy sub metering, see plot3.png
        ## (2,2) X-axis is datetime, Y-axis is Global_reactive_power
        ## Data comes from a subset of https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
        ## Date range 01-FEB-2007 to 02-FEB-2007 subsetted to file ./goodData.txt
        #
        ## Graph type is line
        ## Output is .png format, 480 pixels x 480 pixels
        
        setwd("/home/mark/R/Classwork-In-Progress/ExDat013/Project1/ExData_Plotting1")
        
        fileName <- "./goodData.txt"
        workingTable <- read.table(fileName, sep = ";", header = TRUE, na.strings = "?", comment.char = "")
        
        
        # Make DateAndTime merged data column for x-axis. 
        workingTable$DateAndTime = as.POSIXct(paste(workingTable$Date, workingTable$Time), format="%d/%m/%Y %H:%M:%S")
        
        
        # Set up graph grid
        par(mfrow=c(2,2))
        
        #>>Set up plot 1
        plot(workingTable$DateAndTime, workingTable$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
                
        #>>Set up plot 2
        plot(workingTable$DateAndTime, workingTable$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        #>>Set up plot 3
        plot(workingTable$DateAndTime, workingTable$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col ="black")
        lines(workingTable$DateAndTime, workingTable$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
        lines(workingTable$DateAndTime, workingTable$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
                
       #>>Set up plot 4
        plot(workingTable$DateAndTime, workingTable$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
        
        
        # chartTitle is not used in this chart
        # xAxisLabel is not used in this chart
        yAxisLabel <- "Energy sub metering"
        
        
        # Generate Graph
        plot(workingTable$DateAndTime, workingTable$Sub_metering_1, type = "l", xlab = "", ylab = yAxisLabel, col ="black")
        lines(workingTable$DateAndTime, workingTable$Sub_metering_2, type = "l", xlab = "", ylab = yAxisLabel, col = "red")
        lines(workingTable$DateAndTime, workingTable$Sub_metering_3, type = "l", xlab = "", ylab = yAxisLabel, col = "blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
        
        # Output to file
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        
}