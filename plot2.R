#The code creates a line plot of Global Active Power vs Dates in png format (480x480), with transparent backgrounds




#Reading the txt file which is sperated by ';' and the NA's are '?'
data <- read.table("household_power_consumption.txt",header= TRUE, sep =";",na.strings ="?")

#Subsetting the data for 2 days (1/2/2007) and (2/2/2007)
data_subset <- subset(data, (data$Date=="1/2/2007") | (data$Date=="2/2/2007"))

#Combining the Dates and Time together and converting it Date anda Time format
data_subset$Date <- strptime(paste(data_subset$Date,data_subset$Time), format = "%d/%m/%Y %H:%M:%S")

#Starting the graphics device and setting the with=480 and height = 480
png(filename = "plot2.png", width = 480, height = 480)

#Setting the global background color to transparent
par(bg=NA)

#Plotting Global Active Power vs Date in line format
plot(data_subset$Date,data_subset$Global_active_power,type = "l", xlab ="", ylab ="Global Active Power (kilowatts)")

dev.off()#Closing the graphics device