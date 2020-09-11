# First, we create our png file with the required size
png("plot3.png", width=480, height=480)

# We read the data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# We subset the data
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# For commodity, we transform the Date and Time chars into Date and POSIXlt
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subdata$Time, subdata$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
with(subdata, lines(Time, as.numeric(Sub_metering_1)))
with(subdata, lines(Time, as.numeric(Sub_metering_2), col="red"))
with(subdata, lines(Time, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")

# We close our device as usual
dev.off()