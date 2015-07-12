## Plot4.r
##
## Author: Kyle Williams
##

plot4 <- function() {
    
    # Grab the file and create the data.frame
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
    dat <- read.table(unzip(temp), header=TRUE, sep=";", na.strings = "?")
    unlink(temp)
    
    dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
    dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]
    dat$Time <- strptime(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")
    
    png(filename = "plot4.png", width = 480, height = 480)
    
    par(mfrow = c(2,2))
    
    # top left
    plot(dat$Time, dat$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
    
    # top right
    plot(dat$Time, dat$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    
    # bottom left
    plot(dat$Time, dat$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
    lines(dat$Time, dat$Sub_metering_2, type="l", col="red")
    lines(dat$Time, dat$Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", bg="transparent")
    
    
    # bottom right
    plot(dat$Time, dat$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
    
    dev.off()
}