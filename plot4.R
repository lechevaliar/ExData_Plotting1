read<-read.table("household_power_consumption.txt",sep=";")
data<-subset(read,read[,1]=="1/2/2007"|read[,1]=="2/2/2007")
datetime<-as.character(strptime(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S"))
for (i in 3:9)
{
  data[,i]<-as.numeric(levels(data[,i]))[data[,i]]
}
par(mfrow=c(2,2))
#topleft
plot(as.POSIXlt(datetime), data[,3], type = "l",ylab="Global active power (kW)",xlab="")
#topright
plot(as.POSIXlt(datetime), data[,5], type = "l",ylab="Voltage",xlab="")
#bottomleft
plot(as.POSIXlt(datetime), data[,7], type = "l",ylab="Energy sub metering",xlab="",col="darkgreen")
lines(as.POSIXlt(datetime),data[,8],type = "l",col="orange")
lines(as.POSIXlt(datetime),data[,9],type = "l",col="darkblue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('darkgreen', 'orange', 'darkblue'),cex=0.6)
#bottomright
plot(as.POSIXlt(datetime), data[,4], type = "l",ylab="Global reactive power (kW)",xlab="")
dev.copy(png, file = "plot4.png")
dev.off() 