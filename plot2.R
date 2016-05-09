## Read file for 2/1/2007 and 2/2/2007 only
plots<-subset(read.csv("household_power_consumption.txt",header = TRUE, sep = ";"),Date == "1/2/2007" | Date == "2/2/2007")

## Load ggplot
library(ggplot2)
##xplot<-subset(as.POSIXct(paste(plots$Date, plots$Time), format="%Y-%m-%d %H:%M:%S"), !is.na(plots$Date))
xplot<-subset(plots$Time, !is.na(plots$Date))
yplot<-as.numeric(subset(plots$Global_active_power, !is.na(plots$Date)))
plot(xplot, yplot, xlab = "Time", ylab = "Global Active Power (kilowatts)") 

##Copy to a png file in working directory
dev.copy(png, "Plot2.png", width = 480, height = 480)
dev.off()