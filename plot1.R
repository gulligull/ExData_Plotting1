##### plot 1 #####

#download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")

#read in data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#convert Date to class Date
#data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datasub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#build graph and save as png file
png("plot1.png", width = 480, height = 480)
with(datasub, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()