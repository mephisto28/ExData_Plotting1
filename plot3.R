#load data
pc <- read.table("hpc.txt", header = TRUE, sep = ";", na.string = "?", 
	colClasses = c(rep("character",2),rep("numeric",7)),  comment.char = "")
pc <- pc[pc$Date == "1/2/2007" | pc$Date == "2/2/2007",]

#tidy data
pc$DateTime <- strptime(paste(pc$Date,pc$Time),format = "%d/%m/%Y %H:%M:%S")
pc <- pc[,c(10,3:9)]

#plot data
png("plot3.png")

plot(pc$DateTime, pc$Sub_metering_1, ylab='Energy sub metering', 
	xlab='', type='l', col = "black")
lines(pc$DateTime, pc$Sub_metering_2, col = "red")
lines(pc$DateTime, pc$Sub_metering_3, col = "blue")
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
	col = c("black", "red", "blue"), lty = "solid")

dev.off()