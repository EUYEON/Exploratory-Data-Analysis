datatwo<-"household_power_consumption.txt"
data_two<-read.table(datatwo,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
data_sub_two<-data[data_two$Date %in% c("1/2/2007","2/2/2007"),]

datetime<-strptime(paste(data_sub_two$Date,data_sub_two$Time, sep=""),"%d/%m/%Y %H:%M:%S")
g_active_power<-as.numeric(data_sub_two$Global_active_power)
png("Plot2.png",width=480, height = 480)
#we'll use a plot and select the option for example type ylab etc
plot(datetime, g_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
