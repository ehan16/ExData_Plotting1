# First, we create our png file with the required size
png("plot1.png", width=480, height=480)

# We read the data
data <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

# We subset the data
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Graph the hist
hist(as.numeric(subdata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

# Graph the title
title(main="Global Active Power")

# We close our device as usual
dev.off()