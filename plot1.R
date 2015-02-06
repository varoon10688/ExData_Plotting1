#The code creates a histogram of Global Active Power in png format (480x480), with transparent backgrounds


#Reading the txt file which is sperated by ';' and the NA's are '?'
data <- read.table("household_power_consumption.txt",header= TRUE, sep =";",na.strings ="?")

#Subsetting the data for 2 days (1/2/2007) and (2/2/2007)
data_subset <- subset(data, (data$Date=="1/2/2007") | (data$Date=="2/2/2007"), select = Global_active_power)

#Starting the graphics device and setting the with=480 and height = 480
png(filename = "plot1.png", width = 480, height = 480)

#Setting the global background color to transparent
par(bg=NA)

#Plotting the histogram for Global active power, the default option is frequency
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off() #Closing the graphics device