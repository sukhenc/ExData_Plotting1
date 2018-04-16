#read the data and make subset using Date "1/2/2007" or "2/2/2007"
fn <- "./data/household_power_consumption.txt"
all_data <- read.table(fn, header = TRUE, as.is = TRUE, sep = ";", na.strings="?",
colClasses = c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
data <- all_data[(all_data$Date=="1/2/2007" | all_data$Date=="2/2/2007" ), ]
DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime, data)
rownames(data) = 1:nrow(data)

#make plot 2
par(mfcol=c(1,1))
plot(data$Global_active_power~data$DateTime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
## export file
dev.copy(png, file="./ExData_Plotting1/plot2.png", height=480, width=480, units = "px")
dev.off()

