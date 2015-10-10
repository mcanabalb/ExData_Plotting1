## Set locale in "English", my default is Spanish
Sys.setlocale("LC_ALL","English")

## Read file
power <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                    colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")

power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

power$Date_Time <- paste(power$Date, power$Time)
power$Date_Time <- strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S") 

## open Device
  png(filename = "plot2.png",
      width = 480, height = 480, units = "px", 
      bg = "white")

# Make plot
with(power, 
     plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Turn off device
dev.off()