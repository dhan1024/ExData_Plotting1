
library(dplyr)

setwd("C:/Users/dhan/Desktop/R course/Course 4_graphic/wk1")

## Read in the data, just the rows associated with "2007-02-01" and "2007-02-02"
dat <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)[66637:69516, ]

## Convert all consumption variables into numeric format
dat <- dat %>% mutate_at(., c(3:9), funs(as.numeric))

## Histogram of global active power, save as png
png("plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowat)")
dev.off()