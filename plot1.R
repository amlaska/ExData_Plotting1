## Read file for 2/1/2007 and 2/2/2007 only
plots<-subset(read.csv("household_power_consumption.txt",header = TRUE, sep = ";"),Date == "1/2/2007" | Date == "2/2/2007")

## In order to convert to kilowatts, you'd need to divide by 1000. However, because this covers 2 days and not 1, 
## divide by 500
hist(as.numeric(plots$Global_active_power)/500, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##Copy to a png file in working directory
dev.copy(png, "Plot1.png", width = 480, height = 480)
dev.off()