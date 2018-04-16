setwd("C:/Users/sc56603/DataScience/Exploratory Data Analysis/Week1/")

#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./data/data.zip")
unzip ("./data/data.zip", exdir = "./")

#read the data and make subset using Date "1/2/2007" or "2/2/2007"
fn <- "./data/household_power_consumption.txt"
all_data <- read.table(fn, header = TRUE, as.is = TRUE, sep = ";", na.strings="?",
colClasses = c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
data <- all_data[(all_data$Date=="1/2/2007" | all_data$Date=="2/2/2007" ), ]
DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime, data)
rownames(data) = 1:nrow(data)
##verify data 
tail(data); nrow(data); str(data)

#make plot 1
par(mfcol=c(1,1))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
## export file
dev.copy(png, file="./ExData_Plotting1/plot1.png", height=480, width=480, units = "px")
dev.off()

