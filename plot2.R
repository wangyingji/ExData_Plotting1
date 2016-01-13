## create a smaller dataframe with only the data we are interested in plotting 
DT <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
DT.study <- subset(DT, Date == '1/2/2007' | Date == '2/2/2007')

## convert to date class
dates <- DT.study$Date 
times <- DT.study$Time
x <- paste(dates,times)

time_final <- strptime(x, "%e/%m/%Y %H:%M:%S")

GAP <- as.numeric(as.character(DT.study$Global_active_power)) #convert this column from factor type

 
## Plot 2 - Global Active Power histogram
## ======================================
## hist(GAP, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
plot(time_final, GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## write the plot image to a graphics file
dev.copy(png, file = "plot2.png") 
dev.off() ## close the PNG device!
