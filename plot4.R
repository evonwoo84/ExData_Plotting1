# 
# plot4 - 4 graphs
#
plot4 <- function() {
  
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
  png("plot4.png", height = 500, width = 500)
  par(mfrow = c(2, 2))
  
  # graph 1
  plot(x = dataSet$DateTime, y = dataSet$Sub_metering_1, type = "l", xlab = " ", ylab = "Global Active Power")
  
  # graph 2
  plot(x = dataSet$DateTime, y = dataSet$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  # graph 3
  plot(x = dataSet$DateTime, y = dataSet$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  lines(x = dataSet$DateTime, y = dataSet$Sub_metering_2, col = "red")
  lines(x = dataSet$DateTime, y = dataSet$Sub_metering_3, col = "blue")
  
  legend(x = "topright", y = NULL, cex = 1, box.lwd = NA, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=c(1, 1, 1), col=c("black", "red","blue")) 
  box(which = "plot")

  # graph 4
  plot(x = dataSet$DateTime, y = dataSet$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "l")
  
  
  dev.off()
  
}