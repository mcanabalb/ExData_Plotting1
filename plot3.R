## Set locale in "English", my default is Spanish
Sys.setlocale("LC_ALL","English")

## Read file
power <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                    colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")

power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

power$Date_Time <- paste(power$Date, power$Time)
power$Date_Time <- strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S") 

## open Device
  png(filename = "plot3.png",
      width = 480, height = 480, units = "px", 
      bg = "white")

# Make plot
  with(power,
       plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  lines(x = power$Date_Time, y = power$Sub_metering_2, col = "red")
  lines(x = power$Date_Time, y = power$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
              lty = 1, col = c("black", "red", "blue"))
  
# Turn off device
dev.off()