## Read Data
Namecol <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep = ";")
Namecol <- names(Namecol)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA", skip = 66636, nrows = 2880, col.names = Namecol)

strDates <- data$Date
data$Date <-  as.character(as.Date(strDates, "%d/%m/%Y"))

## plot 1 Global Active Power
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power , col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()