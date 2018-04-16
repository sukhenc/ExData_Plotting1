#read the data and make subset using Date "1/2/2007" or "2/2/2007"
fn <- "./data/household_power_consumption.txt"
all_data <- read.table(fn, header = TRUE, as.is = TRUE, sep = ";", na.strings="?",
                       colClasses = c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
data <- all_data[(all_data$Date=="1/2/2007" | all_data$Date=="2/2/2007" ), ]
DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime, data)
rownames(data) = 1:nrow(data)

#make plot 3
par(mfcol=c(1,1))
plot(data$Sub_metering_1~data$DateTime, xlab = "", ylab = "Energy sub meeting", type="l")
points(data$Sub_metering_2~data$DateTime, type="l", col="red")
points(data$Sub_metering_3~data$DateTime, type="l", col="blue")
legend("topright", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty = 1, cex = 0.75)
## export file
dev.copy(png, file="./ExData_Plotting1/plot3.png", height=480, width=480, units = "px")
dev.off()

