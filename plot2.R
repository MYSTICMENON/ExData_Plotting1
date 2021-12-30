##Read the text file
file <- "household_power_consumption.txt"
powerdata <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
##Subset for data from 2007-02-01 and 2007-02-02
data <-  powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
##Create the plot
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
activepower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()