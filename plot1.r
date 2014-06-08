hpc <- read.csv("household_power_consumption.txt", na.strings = c("?", ""), sep = ";")
hpc <- within(hpc, date <- as.Date(Date, "%d/%m/%Y"))
hpcFiltered <- hpc[hpc$date >= as.Date("2007-02-01") & hpc$date <= as.Date("2007-02-02"),]

png("plot1.png", width = 480, height = 480)
hist(hpcFiltered$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
