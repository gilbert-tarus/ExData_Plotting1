# Reading Household Power consumption data.
HouseholdPower <-read.csv("data/household_Power_consumption.txt",sep = ";")
## Subsetting the data
mydata <- subset(HouseholdPower,Date=="1/2/2007" | Date =="2/2/2007")

# Transforming the Date and Time variables from characters into objects of type Date and POSIXlt respectively
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")
mydata[1:1440,"Time"] <- format(mydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
mydata[1441:2880,"Time"] <- format(mydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(mydata$Time,as.numeric(as.character(mydata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

## saving the plot to png file
dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px") ## Copy the plot to a PNG file
dev.off()
