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

epc_final_plot1<-as.numeric(gsub("?","",epc_filter$Global_active_power))

setwd("C:/Users/munshfa/Desktop/Personal/Coursera/Exploratory Data analysis/Week1/ExData_Plotting1/")
png(file = "plot1.png", bg = "transparent")
hist(epc_final_plot1,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()




 
