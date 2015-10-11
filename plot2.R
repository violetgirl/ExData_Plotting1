# Set working diretory
setwd("C:/Users/postdoc/Desktop/learn_R/")
# Export data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Set Date column as class Date
data$Date <- as.Date(data$Date,"%d/%m/%Y")
# Subset Data only to Feb 1 and Feb 2 2007
data_cut <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
# Set Time column as class POSIXlt 
data_cut$time_tmp <- paste(data_cut$Date, data_cut$Time)
df <- as.data.frame(data_cut)
df$Time <- strptime(df$time_tmp, format = "%Y-%m-%d %H:%M:%S")

# Plot Graph # 2
png(filename="plot2.png",width=480,height=480)
plot(df$Time,df$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()