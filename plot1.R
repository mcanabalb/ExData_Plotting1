## Set locale in "English", my default is Spanish
Sys.setlocale("LC_ALL","English")

## Read file
power <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                    colClasses = c(rep("character",2), rep("numeric", 7)), na.strings = "?")

power <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

## open Device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

# Make plot
hist(power$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (Kilowatts)",
     ylab="Frequency",
     col="red")

# Turn off device
dev.off()