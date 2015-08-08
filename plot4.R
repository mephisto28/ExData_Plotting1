#load data
pc <- read.table("hpc.txt", header = TRUE, sep = ";", na.string = "?", 
	colClasses = c(rep("character",2),rep("numeric",7)),  comment.char = "")
pc <- pc[pc$Date == "1/2/2007" | pc$Date == "2/2/2007",]

#tidy data
pc$DateTime <- strptime(paste(pc$Date,pc$Time),format = "%d/%m/%Y %H:%M:%S")
pc <- pc[,c(10,3:9)]

#plot data
png("plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2))

hist(pc$Global_active_power,main='Global Active Power',
	xlab='Global Active Power (kilowatts)',col='red')

plot(pc$DateTime,pc$Global_active_power,ylab='Global Active Power (kilowatts)', 
	xlab='', type='l')


plot(pc$DateTime, pc$Sub_metering_1, ylab='Energy sub metering', 
	xlab='', type='l', col = "black")
lines(pc$DateTime, pc$Sub_metering_2, col = "red")
lines(pc$DateTime, pc$Sub_metering_3, col = "blue")
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
	col = c("black", "red", "blue"), lty = "solid")

plot(pc$DateTime, pc$Global_reactive_power, ylab = "Global_reactive_power", 
	xlab = "datetime", type = "l")

dev.off()