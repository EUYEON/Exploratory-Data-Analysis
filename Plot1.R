##I'll open the text file and erase my directory
dataone<-"household_power_consumption.txt"
data<-read.table(dataone,header=TRUE, sep=";",stringsAsFactors = FALSE,dec=".")
data_sub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
##It is road the date.

g_active_power<-as.numeric(data_sub$Global_active_power)
png("Plot1.png",width=480, height = 480)
##To make a image file, I'll set a option
hist(g_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

