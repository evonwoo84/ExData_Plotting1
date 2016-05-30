# 
# plot2 - Global Active Power(kw) vs Date
#
plot2 <- function() {
  
  windows()
  dev.cur()
  
  # Read dataSetSet from the dates 2007-02-01 and 2007-02-02 
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
  
  # combine date time as Y-axis ("%d/%m/%Y %H:%M:%S")
  dt <- character()
  for (i in 1:2880) {
    dt <- c(dt, paste(dataSet$Date[i], dataSet$Time[i])) 
  }
  dataSet$DateTime <- strptime(dt, format="%d/%m/%Y %H:%M:%S")
  
  # Plot graph
  png("plot2.png", height = 500, width = 500)
  plot(x = dataSet$DateTime, y = dataSet$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
  dev.off()
  
}