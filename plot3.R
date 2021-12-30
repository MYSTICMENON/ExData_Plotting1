##Read the text file
file <- "household_power_consumption.txt"
powerdata <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
##Subset for data from 2007-02-01 and 2007-02-02
data <-  powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
##Create the plot
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()