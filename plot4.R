  # The code is used to create multiple plots orderd column wise
  #Plot 1 - a line plot of Global Active Power vs Date
  #Plot 2 - a line plot of Sub_metering_1, Sub_metering_2, Sub_metering_3 vs Date. Multiple plots in the same graphics device
  #Plot 3 - a line plot of Voltage vs Date
  #Plot 4 - a line plot of Global Reactive Power vs Date



  #Reading the txt file which is sperated by ';' and the NA's are '?'
  data <- read.table("household_power_consumption.txt",header= TRUE, sep =";",na.strings ="?")
  
  #Subsetting the data for 2 days (1/2/2007) and (2/2/2007)
  data_subset <- subset(data, (data$Date=="1/2/2007") | (data$Date=="2/2/2007"))
  
  #Combining the Dates and Time together and converting it Date anda Time format
  data_subset$Date <- strptime(paste(data_subset$Date,data_subset$Time), format = "%d/%m/%Y %H:%M:%S")
  
  #Starting the graphics device and setting the with=480 and height = 480
  png(filename = "plot4.png", width = 480, height = 480)
  
  #Setting the global background color to transparent and creating a column array 2x2 for plotting in the same canvas
  par(mfcol = c(2,2), bg= NA)
  
  #Plot 1 - a line plot of Global Active Power vs Date
  plot(data_subset$Date,data_subset$Global_active_power,type = "l", xlab ="", ylab ="Global Active Power")
  
  #Plot 2 - a line plot of Sub_metering_1, Sub_metering_2, Sub_metering_3 vs Date. Multiple plots in the same graphics device
  plot(data_subset$Date,data_subset$Sub_metering_1,type = "l", xlab ="", ylab ="Energy sub metering")
  lines(data_subset$Date,data_subset$Sub_metering_1)
  lines(data_subset$Date,data_subset$Sub_metering_2, col= "red")
  lines(data_subset$Date,data_subset$Sub_metering_3, col ="blue")
  legend("topright",col= c("black","red","blue"),bty = "n",lty = c("solid", "solid", "solid"),c ("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Plot 3 - a line plot of Voltage vs Date
  plot(data_subset$Date,data_subset$Voltage,type = "l", xlab ="datetime", ylab ="Voltage")
  
  #Plot 4 - a line plot of Global Reactive Power vs Date
  plot(data_subset$Date,data_subset$Global_reactive_power,type = "l", xlab ="datetime", ylab ="Global_reactive_power")
  
  dev.off()#Closing the graphics device