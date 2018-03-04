
library(dplyr)

setwd("C:/Users/dhan/Desktop/R course/Course 4_graphic/wk1")

## Read in the data, just the rows associated with "2007-02-01" and "2007-02-02"
dat <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)[66637:69516, ]

## Convert consumption variables to numeric and convert date/time to date format
dat <- dat %>% mutate_at(., c(3:9), funs(as.numeric)) %>% 
                mutate(time = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

## Line graph of global active power by the minute
png("plot2.png", width = 480, height = 480)
par(mfrow = c(1,1))
plot(dat$time, dat$Global_active_power, ylab = "Global Active Power (kilowat)", xlab = "", type = "l")
dev.off()