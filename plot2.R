#Plot2
#reading the data
read<-read.table("household_power_consumption.txt",sep=";")
data<-subset(read,read[,1]=="1/2/2007"|read[,1]=="2/2/2007")
datetime<-as.character(strptime(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S"))
#plotting the data
plot(as.POSIXlt(datetime), data[,3], type = "l",ylab="Global active power (kW)",xlab="")
#Copying Image
dev.copy(png, file = "plot2.png")
dev.off() 