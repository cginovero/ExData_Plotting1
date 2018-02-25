
## Getting full dataset
setwd("H:/Data Science - DOST/DOST - FILE/Exploratory Data Analysis/Course Project 1")
plot2_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# data subset
subset_plot2 <- subset(plot2_data, Date %in% c("1/2/2007","2/2/2007"))
subset_plot2$Date <- as.Date(subset_plot2$Date, format="%d/%m/%Y")


#date conversion
plot2_datetime <- paste(as.Date(subset_plot2$Date), subset_plot2$Time)
subset_plot2$Datetime <- as.POSIXct(plot2_datetime)

#plot 2
plot(subset_plot2$Global_active_power~subset_plot2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="DateTime")

#title
title(main="Global Active Power")

#PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()