# FILE: plot4.R
# CLW 2018-12-07

#setwd("./coursera")
data_file <- "household_power_consumption.txt"
power_df <- read.csv2(data_file, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

power_df_2days <- subset(power_df, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(power_df_2days$Date, power_df_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(power_df_2days$Global_active_power)
Voltage <- as.numeric(power_df_2days$Voltage)
Global_reactive_power <- as.numeric(power_df_2days$Global_reactive_power)

Sub_metering_1 = as.numeric(power_df_2days$Sub_metering_1)
Sub_metering_2 = as.numeric(power_df_2days$Sub_metering_2)
Sub_metering_3 = as.numeric(power_df_2days$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime,Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

#rm(list=setdiff(ls(), c("power_df", "power_df_2days")))
