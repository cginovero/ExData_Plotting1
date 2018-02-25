## Getting full dataset
setwd("H:/Data Science - DOST/DOST - FILE/Exploratory Data Analysis/Course Project 1")
plot1_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# data subset

subset_plot1 <- subset(plot1_data, Date %in% c("1/2/2007","2/2/2007"))
subset_plot1$Date <- as.Date(subset_plot1$Date, format="%d/%m/%Y")


#plot1
plotGlobalActPower <- as.numeric(subset_plot1$Global_active_power)
hist(plotGlobalActPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()