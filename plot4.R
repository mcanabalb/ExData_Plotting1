## Set locale in "English", my default is Spanish
Sys.setlocale("LC_ALL","English")

## Read file
power <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                    colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")

power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

power$Date_Time <- paste(power$Date, power$Time)
power$Date_Time <- strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S") 


## open Device
  png(filename = "plot4.png",
      width = 480, height = 480, units = "px", 
      bg = "white")

# Make 4 plot,s in 1

  ## Split into four plotting regions
  par(mfcol = c(2, 2))
  
  ## Create plots and send to file
  
  ## PLOT1 - 'Global Active Power' vs 'Time' plot
  with(power, plot(Date_Time, Global_active_power, type = "l", 
                   xlab = "", ylab = "Global Active Power"))
  
  ## PLOT2 - 'Energy sub metering' vs 'Time' plot
  with(power,
       plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  lines(x = power$Date_Time, y = power$Sub_metering_2, col = "red")
  lines(x = power$Date_Time, y = power$Sub_metering_3, col = "blue")
  legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, col = c("black", "red", "blue"))
  
  ## PLOT3 - 'Voltage' vs 'Time' plot
  with(power,
       plot(x = Date_Time, y = Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
  
  ## PLOT4 -  'Global_reactive_power' vs 'Time' plot
  with(power,
       plot(x = power$Date_Time, y = power$Global_reactive_power, type = "l",
            xlab = "datetime", ylab = "Global_Reactive_Power"))

# Turn off device
dev.off()