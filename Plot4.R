datafour<-"household_power_consumption.txt"
data_four<-read.table(datafour,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
data_sub_four<-data[data_four$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(data_sub_four$Date,data_sub_four$Time, sep=""),"%d/%m/%Y %H:%M:%S")
g_active_power<-as.numeric(data_sub_four$Global_active_power)
##now Glabal_reactive_power will be add. so make an another value
g_reactive_power <- as.numeric(data_sub_four$Global_reactive_power)
volt <- as.numeric(data_sub_four$Voltage)
submeter1 <- as.numeric(data_sub_four$Sub_metering_1)
submeter2 <- as.numeric(data_sub_four$Sub_metering_2)
submeter3 <- as.numeric(data_sub_four$Sub_metering_3)

png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
## We'll use row c(2,2) for four matrix.

plot(datetime, g_active_power, type="l", xlab="", ylab="Global Active Power",cex=0.2)

plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
##this plot is same in plot3 
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, g_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

