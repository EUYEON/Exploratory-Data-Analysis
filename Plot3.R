datathree<-"household_power_consumption.txt"
data_three<-read.table(datathree,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
data_sub_three<-data[data_three$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(data_sub_three$Date,data_sub_three$Time, sep=""),"%d/%m/%Y %H:%M:%S")
g_active_power<-as.numeric(data_sub_three$Global_active_power)
##We have 3 valuse for sub_metering 1 through 3
submeter1 <- as.numeric(data_sub_three$Sub_metering_1)
submeter2 <- as.numeric(data_sub_three$Sub_metering_2)
submeter3 <- as.numeric(data_sub_three$Sub_metering_3)
png("Plot3.png", width=480, height=480)
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
## we make a one plot and add two lines in plot.
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")

##we have a legend to explane the each line
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
