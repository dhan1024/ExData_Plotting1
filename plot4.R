library(dplyr)

setwd("C:/Users/dhan/Desktop/R course/Course 4_graphic/wk1")

## Read in the data, just the rows associated with "2007-02-01" and "2007-02-02"
dat <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)[66637:69516, ]

## Convert consumption variables to numeric and convert date/time to date format
dat <- dat %>% mutate_at(., c(3:9), funs(as.numeric)) %>% 
    mutate(time = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

## Line graph of global active power by the minute
png("plot4.png", width = 480, height = 480)

### Global set the 2X2 plot structure (mfrow), plot margin (mar), margin line for axis label (mpg),
### the size of labels (cex.lab), and the size of the axis annotation (cex.axis)
par(mfrow = c(2,2), mar = c(4.5,4,3,1), mgp = c(2.5,1,0),
    cex.lab = .9, cex.axis = .8)

plot(dat$time, dat$Global_active_power,  type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(dat$time, dat$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

with(dat, { plot(dat$time, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
            lines(dat$time, dat$Sub_metering_2, col = "red")
            lines(dat$time, dat$Sub_metering_3, col = "blue")
            
            ### Set legend to be borderless by setting bty to "n"
            legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   lty = c("solid", "solid", "solid"),
                   col = c("black", "red", "blue"),
                   cex = .7, bty = "n") })

plot(dat$time, dat$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()