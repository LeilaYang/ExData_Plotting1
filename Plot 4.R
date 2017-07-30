##Read DATA_row "2007-02-01" to "2007-02-02"
Namecol <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep = ";")
Namecol <- names(Namecol)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA", skip = 66636, nrows = 2880, col.names = Namecol)

strDates <- data$Date
data$Date <-  as.character(as.Date(strDates, "%d/%m/%Y"))



## Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
#######4(1,1)
y_1 <- data$Global_active_power
x_1 <- 1:length(data$Time)
plot(x_1, y_1, "l", xlab = " ", ylab = "Global Active Power", xaxt = 'n' )
axis(1, at = c(0,length(data$Date)/2,length(data$Date)), labels = c("Thu", "Fri", "Sat") )

#######4(1,2)
y_2 <- data$Voltage
x_2 <- 1:length(data$Time)
plot(x_2, y_2, "l", xlab = "datetime", ylab = "Voltage", xaxt = 'n')
axis(1,  at = c(0,length(data$Date)/2,length(data$Date)), labels = c("Thu", "Fri", "Sat") )

#######4(2,1)
y_3_1 <- data$Sub_metering_1
y_3_2 <- data$Sub_metering_2
y_3_3 <- data$Sub_metering_3
x_3 <- 1:length(data$Time)
plot(x_3, y_3_1, ylim = c(min(y_3_1), max(y_3_1)), "l", col = "Black",  xlab = " ", ylab = "Energy Sub Metering", xaxt = 'n')
par(new = TRUE)
plot(x_3, y_3_2, ylim = c(min(y_3_1), max(y_3_1)), "l", col = "Red", axes = FALSE, xlab = "", ylab = "")
par(new = TRUE)
plot(x_3, y_3_3, ylim = c(min(y_3_1), max(y_3_1)), "l", col = "Blue", axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(0,length(data$Date)/2,length(data$Date)), labels = c("Thu", "Fri", "Sat"))
legend("topright",  box.lwd = 0, bg="transparent", lty = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#######4(2,2)
y_4 <- data$Global_reactive_power
x_4 <- 1:length(data$Time)
plot(x_4, y_4, "l", xlab = "datetime", ylab = "Global reactive power", xaxt = 'n')
axis(1,at = c(0,length(data$Date)/2,length(data$Date)), labels = c("Thu", "Fri", "Sat") )
dev.off()

