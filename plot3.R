# Reading Household Power consumption data.
HouseholdPower <-read.csv("data/household_power_consumption.txt",sep = ";")
## subsetting the data
mydata <- subset(HouseholdPower,Date=="1/2/2007" | Date =="2/2/2007")

# Transforming the Date and Time variables from characters into objects of type Date and POSIXlt respectively
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")
mydata[1:1440,"Time"] <- format(mydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
mydata[1441:2880,"Time"] <- format(mydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the basic plot functions
plot(mydata$Time,mydata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",ylim = c(0,40))
with(mydata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(mydata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(mydata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## saving the plot to png file
dev.copy(png, file = "plot3.png",width = 480, height = 480, units = "px") ## Copy the plot to a PNG file
dev.off()
