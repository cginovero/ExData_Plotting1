#setting working Directory

setwd("H:/Data Science - DOST/DOST - FILE/Exploratory Data Analysis/Course Project 1")

plot4_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# data subset

data_plot4 <- subset(plot4_data, Date %in% c("1/2/2007","2/2/2007"))
data_plot4$Date <- as.Date(data_plot4$Date, format="%d/%m/%Y")

#date conversion
datetime <- paste(as.Date(data_plot4$Date), data_plot4$Time)
data_plot4$Datetime <- as.POSIXct(datetime)



#ploting the data

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_plot4, {
  #sub plot 1
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  #sub plot 2
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  
  #sub plot 3
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col="red")
    lines(Sub_metering_3~Datetime,col= "blue")
    legend("topright", col=c("black", "red", "blue"),  
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1, bty = "n", cex =0.5)
  
  #sub plot 4
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)", xlab="datetime")
})

#PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()