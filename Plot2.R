library(dplyr)

# Read archive .txt

electro <- read.csv("household_power_consumption.txt", header = TRUE, 
                    sep = ';', nrows = 70000, dec = ".", stringsAsFactors = FALSE)

# Change factors by numerics

electro$Global_active_power <- as.numeric(electro$Global_active_power)
electro$Global_reactive_power <- as.numeric(electro$Global_reactive_power)
electro$Voltage <- as.numeric(electro$Voltage)
electro$Global_intensity <- as.numeric(electro$Global_intensity)
electro$Sub_metering_1 <- as.numeric(electro$Sub_metering_1)
electro$Sub_metering_2 <- as.numeric(electro$Sub_metering_2)
electro$Sub_metering_2 <- as.numeric(electro$Sub_metering_3)

# Select dates

electroplot <-electro[electro$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(electroplot$Date, electroplot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, electroplot$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

