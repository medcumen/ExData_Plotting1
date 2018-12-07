# FILE: plot1.R
# CLW 2018-12-07

#setwd("./coursera")
data_file <- "household_power_consumption.txt"
power_df <- read.csv2(data_file, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
power_df$Date <- as.Date(power_df$Date, "%d/%m/%Y")

power_df_2days <- subset(power_df, Date == "2007-02-01" | Date == "2007-02-02")

Global_active_power <- as.numeric(power_df_2days$Global_active_power)

png("plot1.png", width=480, height=480)

hist(Global_active_power,
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    col="red"
)

dev.off()

