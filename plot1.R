# 
# plot1 - Frequency vs Global Active Power(kw)
#
plot1 <- function() {
  
  windows()
  dev.cur()
  
  # Read dataSet from the dates 2007-02-01 and 2007-02-02 
  dataSet <- read.table(file="household_power_consumption.txt"
                     , header = TRUE
                     , sep = ";"
                     , skip = 66636
                     , nrows = 2880
                     , col.names = c("Date", "Time", "Global_active_power"
                                     , "Global_reactive_power", "Voltage"
                                     , "Global_intensity", "Sub_metering_1"
                                     , "Sub_metering_2", "Sub_metering_3"
                     )
                     , colClasses= c("character", "character", "numeric"
                                     , "numeric", "numeric", "numeric"
                                     , "numeric", "numeric", "numeric"
                     )
  )
  
  # Plot graph 
  png("plot1.png", height = 500, width = 500)
  hist(dataSet$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
  dev.off()
  
}