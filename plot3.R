#Plot3
#reading the data
read<-read.table("household_power_consumption.txt",sep=";")
data<-subset(read,read[,1]=="1/2/2007"|read[,1]=="2/2/2007")
datetime<-as.character(strptime(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S"))
for (i in 3:9)
{
  data[,i]<-as.numeric(levels(data[,i]))[data[,i]]
}
#plotting the data
plot(as.POSIXlt(datetime), data[,7], type = "l",ylab="Energy sub metering",xlab="")
lines(as.POSIXlt(datetime),data[,8],type = "l",col="red")
lines(as.POSIXlt(datetime),data[,9],type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'))
#Copying Image
dev.copy(png, file = "plot3.png")
dev.off() 