
## Getting full dataset
setwd("H:/Data Science - DOST/DOST - FILE/Exploratory Data Analysis/Course Project 1")
plot3_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# data subset

subset_plot3 <- subset(plot3_data, Date %in% c("1/2/2007","2/2/2007"))
subset_plot3$Date <- as.Date(subset_plot3$Date, format="%d/%m/%Y")


#date conversion
plot3_datetime <- paste(as.Date(subset_plot3$Date), subset_plot3$Time)
subset_plot3$Datetime <- as.POSIXct(plot3_datetime)


## Plot 3
with(subset_plot3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
       lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')
  })

#legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#title
title(main="Energy Sub-metering")

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()