## Plot1.r
##
## Author: Kyle Williams
##

plot1 <- function() {
    
    # Grab the file and create the data.frame
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
    dat <- read.table(unzip(temp), header=TRUE, sep=";", na.strings = "?")
    unlink(temp)
    
    dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
    dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]
    
    png(filename = "plot1.png", width = 480, height = 480)
    
    hist(dat$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, col="Red")
    
    dev.off()
}