hpc <- read.csv("household_power_consumption.txt", na.strings = c("?", ""), sep = ";")
hpc <- within(hpc, date <- as.Date(Date, "%d/%m/%Y"))
hpc <- within(hpc, datetime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
hpcFiltered <- hpc[hpc$date >= as.Date("2007-02-01") & hpc$date <= as.Date("2007-02-02"),]

# run it with english locale to get exactly same axis (on my Polish Windows it produces Polish x labels)
# to set locale to english (for R) go to

png("plot2.png", width = 480, height = 480)
plot(hpcFiltered$datetime, hpcFiltered$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
dev.off()
