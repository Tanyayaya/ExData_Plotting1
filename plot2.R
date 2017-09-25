#set working directory
setwd("C:/R/cousera")
#read the text
powerdata <- read.table("household_power_consumption/household_power_consumption.txt",
                        sep = ";", colClasses = c(Date = "character", 
                                                  Time = "character"), 
                        header = TRUE, na.strings = "?") 

#Extract and load only the data between the dates 2007-02-01 and 2007-02-02
mydata <- subset(powerdata, Date=="1/2/2007"|"2/2/2007")

#Concatenate date and time column
mydata$datetime <- paste(mydata$Date, mydata$Time, sep=" ")

mydata$datetime<- strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")

#Launch a png file and plot the second graphic
png( filename = "plot2.png", width = 480, height = 480 )

with(mydata,plot(datetime, Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)"))
dev.off()
