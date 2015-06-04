# Exploratory Data Analysis ####
# exdata-015
# Course Project #1
# Due: Sun 7 Jun 6:30 pm CST

# Local copy of instructions available in ./Instructions.R and at ####
# https://class.coursera.org/exdata-015/human_grading/view/courses/
#   973509/assessments/3/submissions

function extractData(dfName = "dataSubset.txt")
# Custom function written to check for the subdata for Class Project #1
#
# Define working directory

      refDirectory <- dirname(sys.frame(1)$ofile)

# Check for existence of dataSubset file
# If it exists, return the working directory and dataSubset name

if file.exists(dfName) {
      workingAndSub = c(refDirectory, dfName)
      return(workingAndSub)
}


# If it doesn't exist, extract the data from "household_power_consumption.txt"
# using data from the dates 2007-02-01 and 2007-02-02

masterDataFile <- "household_power_consumption.txt"
bigRead <- read.table(masterDataFile, sep = ";", header = TRUE)
chosenData <- rbind(bigRead[bigRead$Date == "1/2/2007", ], bigRead[bigRead$Date == "2/2/2007", ]




#      clean it up, noting that NAs = "?"

# Write to dataSubset file

# Return array containing workign directory and dataSubset name
