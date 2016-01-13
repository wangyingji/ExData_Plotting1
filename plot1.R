
## create a smaller dataframe with only the data we are interested in plotting 
DT <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
DT.study <- subset(DT, Date == '1/2/2007' | Date == '2/2/2007')

GAP <- as.numeric(as.character(DT.study$Global_active_power)) #convert this from factor type

## Plot 1 - Global Active Power histogram
## ======================================
hist(GAP, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

## write the plot image to a graphics file
dev.copy(png, file = "plot1.png") 
dev.off()
