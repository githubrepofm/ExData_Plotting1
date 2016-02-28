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

x<-epc_filter$datatime
y<-epc_filter$Global_active_power

setwd("C:/Users/munshfa/Desktop/Personal/Coursera/Exploratory Data analysis/Week1/ExData_Plotting1/")
png(file = "plot2.png", bg = "transparent")
plot(x,y,type = "l",ylab = "Global Active Power (kilowatts)")
dev.off()




 
