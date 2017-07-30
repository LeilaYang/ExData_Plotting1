##Read DATA_row "2007-02-01" to "2007-02-02"
Namecol <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep = ";")
Namecol <- names(Namecol)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA", skip = 66636, nrows = 2880, col.names = Namecol)

strDates <- data$Date
data$Date <-  as.character(as.Date(strDates, "%d/%m/%Y"))

## Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
y_2 <- data$Global_active_power
x_2 <- 1:length(data$Time)
plot(x_2, y_2, "l", xlab = " ", ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(1, at = c(0,length(data$Date)/2,length(data$Date)), labels = c("Thu", "Fri", "Sat") )
dev.off()