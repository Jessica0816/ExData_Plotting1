data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                 nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
with(data1, {
        plot(Global_active_power~Datetime, type="l",
             xlab="", ylab="Global Active Power (kilowatts)")
})

dev.off()