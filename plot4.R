# First, we create our png file with the required size
png("plot4.png", width=480, height=480)

# We read the data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# We subset the data
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# For commodity, we transform the Date and Time chars into Date and POSIXlt
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# We need to show many graphs
par(mfrow = c(2, 2)) 

plot(subdata$Time, as.numeric(subdata$Global_active_power), type="l", xlab="", ylab="Global Active Power")
plot(subdata$Time, as.numeric(subdata$Voltage), type="l", xlab="datetime", ylab="Voltage")
plot(subdata$Time, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")

lines(subdata$Time, as.numeric(subdata$Sub_metering_1), type="l")
lines(subdata$Time, as.numeric(subdata$Sub_metering_2), type="l", col="red")
lines(subdata$Time, as.numeric(subdata$Sub_metering_3), type="l", col="blue")

legend("topright", lty=1, lwd=2.5, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subdata$Time, as.numeric(subdata$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

# We close our device as usual
dev.off()