## Plot2.r
##
## Author: Kyle Williams
##

plot2 <- function() {
    
    # Grab the file and create the data.frame
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
    dat <- read.table(unzip(temp), header=TRUE, sep=";", na.strings = "?")
    unlink(temp)
    
    dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
    dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]
    dat$Time <- strptime(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")
    
    png(filename = "plot2.png", width = 480, height = 480)
    
    plot(dat$Time, dat$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts")
    
    dev.off()
}