# Reading Household Power consumption data.

HouseholdPower <- read.csv("data/household_power_consumption.txt",sep = ";")
## Subsetting the data
mydata <- subset(HouseholdPower,Date=="1/2/2007" | Date =="2/2/2007")

## Transforming the Date and Time variables from characters into objects of type Date and POSIXlt respectively
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")
mydata[1:1440,"Time"] <- format(mydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
mydata[1441:2880,"Time"] <- format(mydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(mydata,{
        plot(mydata$Time,as.numeric(as.character(mydata$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(mydata$Time,as.numeric(as.character(mydata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(mydata$Time,mydata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",ylim = c(0,30))
        with(mydata,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(mydata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(mydata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(mydata$Time,as.numeric(as.character(mydata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_Power",ylim = c(0.0,0.5))
})

## saving the plot to png file
dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px") ## Copy the plot to a PNG file
dev.off()
