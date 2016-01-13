## create a smaller dataframe with only the data we are interested in plotting 
DT <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
DT.study <- subset(DT, Date == '1/2/2007' | Date == '2/2/2007')

## convert to date class
dates <- DT.study$Date 
times <- DT.study$Time
x <- paste(dates,times)

time_final <- strptime(x, "%e/%m/%Y %H:%M:%S")


##Energy Submetering (#convert these columns from factor type to numeric)
SM1 <- as.numeric(as.character(DT.study$Sub_metering_1 ))
SM2 <- as.numeric(as.character(DT.study$Sub_metering_2 ))
SM3 <- as.numeric(as.character(DT.study$Sub_metering_3 ))

## Plot 3 - Sub-metering
## =====================

plot(time_final, SM1, type = "l", ylab = "Energy Sub-metering", xlab = "")
points(time_final, SM2, type = "l", col='red')
points(time_final, SM3, type = "l", col='blue')
legend("topright", pch=15, col = c('black','red','blue'),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## write the plot image to a graphics file
dev.copy(png, file = "plot3.png") 
dev.off() ## close the PNG device!
