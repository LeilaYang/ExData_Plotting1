##Read DATA_row "2007-02-01" to "2007-02-02"
Namecol <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep = ";")
Namecol <- names(Namecol)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA", skip = 66636, nrows = 2880, col.names = Namecol)

strDates <- data$Date
data$Date <-  as.character(as.Date(strDates, "%d/%m/%Y"))


## Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
Sub_M_1 <- data$Sub_metering_1
Sub_M_2 <- data$Sub_metering_2
Sub_M_3 <- data$Sub_metering_3
x_3 <- 1:length(data$Time)
plot(x_3, Sub_M_1, ylim = c(min(Sub_M_1), max(Sub_M_1)), "l", col = "Black",  xlab = " ", ylab = "Energy Sub Metering", xaxt = 'n')
par(new = TRUE)
plot(x_3, Sub_M_2, ylim = c(min(Sub_M_1), max(Sub_M_1)), "l", col = "Red", axes = FALSE, xlab = "", ylab = "")
par(new = TRUE)
plot(x_3, Sub_M_3, ylim = c(min(Sub_M_1), max(Sub_M_1)), "l", col = "Blue", axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(0,1441,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright",lty = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()