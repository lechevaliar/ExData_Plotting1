#Plot1
#reading the data
read<-read.table("household_power_consumption.txt",sep=";")
data<-subset(read,read[,1]=="1/2/2007"|read[,1]=="2/2/2007")
power<-as.numeric(levels(data[,3]))[data[,3]]
#plotting the data
par(mar=c(6,4,2,2))
hist(power,main="Global active power",xlab="Global active power(kW)",col="red")
#Copying Image
dev.copy(png, file = "plot1.png")
dev.off() 