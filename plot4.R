## create a smaller dataframe with only the data we are interested in plotting 
DT <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
DT.study <- subset(DT, Date == '1/2/2007' | Date == '2/2/2007')

## convert each time sample to date class
dates <- DT.study$Date 
times <- DT.study$Time
x <- paste(dates,times)
time_final <- strptime(x, "%e/%m/%Y %H:%M:%S")

## convert the relevant dimensions from their default factor type to measures
GAP <- as.numeric(as.character(DT.study$Global_active_power)) ## Global Active Power measure

SM1 <- as.numeric(as.character(DT.study$Sub_metering_1 ))  ## Energy Submetering measures
SM2 <- as.numeric(as.character(DT.study$Sub_metering_2 ))
SM3 <- as.numeric(as.character(DT.study$Sub_metering_3 ))

VOLTAGE <- as.numeric(as.character(DT.study$Voltage)) ## Voltage measure
RPOWER<- as.numeric(as.character(DT.study$Global_reactive_power)) ## Reactive Power measure


## Plot all 4 graphs on one page
par(mfcol=c(2,2), mar=c(4,4,1,1), oma=c(1,1,1,1))   ## setup the quadrants for each graph

## plot Global Active Power graph
plot(time_final, GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## plot Energy Submetering graph
plot(time_final, SM1, type = "l", ylab = "Energy Sub-metering", xlab = "Submetering Type: black=1, red=2, blue=3")
points(time_final, SM2, type = "l", col='red')
points(time_final, SM3, type = "l", col='blue')
## legend("topright", pch=15, border = 'white', col = c('black','red','blue'),legend = "" )

## plot Voltage vs Time graph
plot(time_final, VOLTAGE, type = "l", ylab = "Voltage", xlab = "datetime")

## plot Global Reactive Power vs Time graph
plot(time_final, RPOWER, type = "l", bty="n", ylab = "Global_reactive_power", xlab = "datetime")



## write the plot image to a graphics file
dev.copy(png, file = "plot4(auto).png") 
dev.off() ## close the PNG device!
