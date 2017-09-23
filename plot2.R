png("plot2.png")
setwd("E:/R/cousera")
data<-read.table("household_power_consumption/household_power_consumption.txt",
                 sep=";",header=FALSE,col.names=c("date","time",
                                                  "global_active_power","global_reactive_power",
                                                  "voltage","global_intensity","sub_metering_1",
                                                  "sub_metering_2","sub_metering_3"),stringsAsFactors = F)
data$date<-as.Date(data$date,"%d/%m/%Y")
startDate = as.Date("2007-02-01");
endDate = as.Date("2007-02-02");
data<-subset(data,date==startDate|date==endDate)
library(lubridate)
data$date<-wday(data$date)
data<-subset(data,global_active_power!="?")
with(data,plot(date,as.numeric(global_active_power),type="line",
      ylab = "Global Active Power(kilowatts)"))
dev.off()