# Reading Household Power consumption data.
HouseholdPower <-read.csv("data/household_power_consumption.txt",sep = ";")

## Subsetting the data
mydata <- subset(HouseholdPower,Date=="1/2/2007" | Date =="2/2/2007")
#calling the basic plot function
hist(as.numeric(as.character(mydata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
## saving the file to png
dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px") ## Copy the plot to a PNG file
dev.off()
