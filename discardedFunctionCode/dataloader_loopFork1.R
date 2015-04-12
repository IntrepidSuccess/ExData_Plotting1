dataloader <- function (fileName = "NULL") {

        ## Generate cached data array for plot1-4.R

## The master data table has 9 columns representing the following data:
##
## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
##      Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
##              It corresponds to the kitchen, containing mainly a dishwasher, 
##              an oven and a microwave (hot plates are not electric but gas powered).
##      Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
##              It corresponds to the laundry room, containing a washing-machine, 
##              a tumble-drier, a refrigerator and a light.
##      Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
##              It corresponds to an electric water-heater and an air-conditioner.

## There are 9 columns and 2075259 rows in the dataset
##
## We are only analyzing data from 2007-02-01 to 2007-02-02 
## (two days worth of data points)

# local working directory
setwd("/home/mark/R/Classwork-In-Progress/ExDat013/Project1/ExData_Plotting1/")


# Identify file
if (fileName == "NULL") {
        fileLocation <- "household_power_consumption.txt"
} else {
        fileLocation <- fileName
}        
        

# Determine classes of file
determineTableClasses <- fread(fileLocation, nrows = 100, sep = ";", header = TRUE)
classes <- sapply(determineTableClasses, class)
colNames <- sapply(determineTableClasses, colnames)
classes[classes == "numeric"] <- "character"
classes[[1]] <- "numeric"
classes[[2]] <- "numeric"

goodDataTable <- data.frame(Date=numeric(),
                            Time=numeric(), 
                            Global_active_power=character(), 
                            Global_reactive_power=character(), 
                            Voltage=character(), 
                            Global_intensity=character(), 
                            Sub_metering_1=character(), 
                            Sub_metering_2=character(), 
                            Sub_metering_3=character(), 
                            stringsAsFactors=FALSE) 


# print(classes) #Debug print line
print(colNames)


#Load the whole file
fullTable <- fread(fileLocation, sep=";", nrows=2075259, header=TRUE, na.strings="?",
                   stringsAsFactors=FALSE, verbose=FALSE,
                   colClasses=classes)

print(nrow(fullTable))


# To evaluate fullTable$Date, use as.Date("16/12/2006", format="%d/%m/%Y") for example

# Define start and end dates of desired data
startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
        print(startDate)
        print(endDate)

for (i in 1:nrow(fullTable)) {
# for (i in 1:50) {
                
        currentLoopDate <- as.Date(fullTable$Date[[i]], format="%d/%m/%Y")

        if((currentLoopDate >= startDate) & (currentLoopDate <= endDate)) 
        { goodDataTable <- rbind(goodDataTable, fullTable$Date[[i]])

        print(i)
        #print(currentLoopDate)
        }

}

        print(nrow(goodDataTable))
#        print(goodDataTable)

write.csv(goodDataTable, file = "./goodDataTable.csv", row.names = FALSE)

return("File written")

}
