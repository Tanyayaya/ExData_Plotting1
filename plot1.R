#set the working directory(in my computer, it is "C:/R/cousera")
setwd("C:/R/cousera")
#read the data
data<-read.table("household_power_consumption/household_power_consumption.txt",
                 sep=";",header=FALSE,col.names=c("date","time",
                 "global_active_power","global_reactive_power",
                 "voltage","global_intensity","sub_metering_1",
                 "sub_metering_2","sub_metering_3"),stringsAsFactors = F)
#change the type of the data
data$date<-as.Date(data$date,"%d/%m/%Y")
#extract the data we need
startDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
data<-subset(data,date==startDate|date==endDate)
data<-subset(data,global_active_power!="?")
#launch the png file and make the plot
png( filename = "plot1.png", width = 480, height = 480 )
with(data,hist(as.numeric(global_active_power),12,
    col="red",main="Global Active Power",xlab = "Global Active Power(kilowatts)",
    ylab = "Frequency"))
dev.off()
