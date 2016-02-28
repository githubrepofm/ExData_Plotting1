if( getwd() != "C:/Users/munshfa/Desktop/Personal/Coursera/Exploratory Data analysis/Week1/Data"
)
setwd("C:/Users/munshfa/Desktop/Personal/Coursera/Exploratory Data analysis/Week1/Data")

#Get the raw data from the file
epc_raw<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#Convert the date and time format
epc_raw_convert<-epc_raw
epc_raw_convert$Date<-as.Date(epc_raw$Date,"%d/%m/%Y")

#Filter for Dates 2007-02-01 and 2007-02-02
epc_filter<-subset(epc_raw_convert,epc_raw_convert$Date %in% as.Date(c("2007-02-01","2007-02-02")))

epc_filter$datatime<-strptime(paste(epc_filter$Date,epc_filter$Time),"%Y-%m-%d %H:%M:%S")

epc_filter$Global_active_power<-as.numeric(gsub("?","",epc_filter$Global_active_power))

epc_filter$Sub_metering_1<-as.numeric(gsub("?","",epc_filter$Sub_metering_1))
epc_filter$Sub_metering_2<-as.numeric(gsub("?","",epc_filter$Sub_metering_2))
epc_filter$Sub_metering_3<-as.numeric(gsub("?","",epc_filter$Sub_metering_3))

x<-epc_filter$datatime
y<-epc_filter$Global_active_power
p<-epc_filter$Sub_metering_1
q<-epc_filter$Sub_metering_2
r<-epc_filter$Sub_metering_3



setwd("C:/Users/munshfa/Desktop/Personal/Coursera/Exploratory Data analysis/Week1/ExData_Plotting1/")
png(file = "plot3.png", bg = "transparent")
plot(x,p,type = "n",ylab = "Energy sub metering")
points(x,p,type = "l",col = "black")
points(x,q,type = "l",col = "red")
points(x,r,type = "l",col = "blue")
legend("topright",lty = 1,col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()




 
