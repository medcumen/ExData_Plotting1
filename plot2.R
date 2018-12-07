# FILE: plot2.R
# CLW 2018-12-07

#setwd("./coursera")
data_file <- "household_power_consumption.txt"
power_df <- read.csv2(data_file, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#power_df_2days <- subset(power_df, Date == "2007-02-01" | Date == "2007-02-02")
power_df_2days <- power_df[power_df$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(power_df_2days$Date, power_df_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(power_df_2days$Global_active_power)

#globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)

plot(datetime,
     Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

dev.off()


