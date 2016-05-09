## Read file for 2/1/2007 and 2/2/2007 only
plots<-subset(read.csv("household_power_consumption.txt",header = TRUE, sep = ";"),Date == "1/2/2007" | Date == "2/2/2007")

## Load ggplot
library(ggplot2)
##xplot<-subset(as.POSIXct(paste(plots$Date, plots$Time), format="%Y-%m-%d %H:%M:%S"), !is.na(plots$Date))
xplot<-subset(plots$Time, !is.na(plots$Date))
sub1<-as.numeric(subset(plots$Sub_metering_1, !is.na(plots$Date)))
sub2<-as.numeric(subset(plots$Sub_metering_2, !is.na(plots$Date)))
sub3<-as.numeric(subset(plots$Sub_metering_3, !is.na(plots$Date)))

##plot(xplot, sub1,  xlab = weekdays(as.Date(plots$Date)), col = "blue", ylab = "Energy Sub Metering") 
##par(col="blue")

ggplot(plots, aes(x = Time)) + 
  geom_line(aes(y = as.numeric(Sub_metering_1)), colour="black") + 
  geom_line(aes(y = as.numeric(Sub_metering_2)), colour = "red") + 
  geom_line(aes(y = Sub_metering_3), colour = "blue") + 
  ylab(label="Energy Sub Metering")  +
  xlab(label = "Time")


##Copy to a png file in working directory
dev.copy(png, "Plot3.png", width = 480, height = 480)
dev.off()