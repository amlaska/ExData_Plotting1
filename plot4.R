## Read file for 2/1/2007 and 2/2/2007 only
plots<-subset(read.csv("household_power_consumption.txt",header = TRUE, sep = ";"),Date == "1/2/2007" | Date == "2/2/2007")

## Load ggplot
library(ggplot2)
##xplot<-subset(as.POSIXct(paste(plots$Date, plots$Time), format="%Y-%m-%d %H:%M:%S"), !is.na(plots$Date))
xplot<-subset(plots$Time, !is.na(plots$Date))
GAP<-as.numeric(subset(plots$Global_active_power, !is.na(plots$Date)))
Volt<-as.numeric(subset(plots$Voltage, !is.na(plots$Date)))
sub1<-as.numeric(subset(plots$Sub_metering_1, !is.na(plots$Date)))
sub2<-as.numeric(subset(plots$Sub_metering_2, !is.na(plots$Date)))
sub3<-as.numeric(subset(plots$Sub_metering_3, !is.na(plots$Date)))
GRP<-as.numeric(subset(plots$Global_reactive_power, !is.na(plots$Date)))


par(mfrow=c(2,2))
##plot(xplot, GAP, xlab = weekdays(as.Date(plots$Date)), ylab = "Global Active Power (kilowatts)") 
##plot(xplot, Volt, xlab = weekdays(as.Date(plots$Date)), ylab = "Voltage") 

##Top Left Quadrant
plot1<-ggplot(plots, aes(x = Time)) + 
  geom_line(aes(y = as.numeric(Global_active_power)/500), colour="black") + 
  ylab(label="Global Active Power (kilowatts)") 


##Top Right Quadrant
plot2<-ggplot(plots, aes(x = Time)) +
  geom_line(aes(y = as.numeric(Voltage)), colour="black") + 
  ylab(label="Voltage")
                      
##Bottom Right Quadrant
plot3<-ggplot(plots, aes(x = Time)) + 
  geom_line(aes(y = as.numeric(Sub_metering_1)), colour="black") + 
  geom_line(aes(y = as.numeric(Sub_metering_2)), colour = "red") + 
  geom_line(aes(y = Sub_metering_3), colour = "blue") + 
  ylab(label="Energy Sub Metering")

##Bottom Left Quadrant
plot4<-ggplot(plots, aes(x = Time)) +
  geom_line(aes(y = as.numeric(Global_reactive_power)), colour="black") + 
  ylab(label="Global Reactive Power")

##Assumes gridExtra library is installed
library("gridExtra")
grid.arrange(plot1, plot2, plot3, plot4, nrow = 2, ncol = 2)


##Copy to a png file in working directory
dev.copy(png, "Plot.png", width = 480, height = 480)
dev.off()