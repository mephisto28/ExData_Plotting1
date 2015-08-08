#load data
pc <- read.table("hpc.txt", header = TRUE, sep = ";", na.string = "?", colClasses = c(rep("character",2),rep("numeric",7)),  comment.char = "")
pc <- pc[pc$Date == "1/2/2007" | pc$Date == "2/2/2007",]

#tidy data
pc$DateTime <- strptime(paste(pc$Date,pc$Time),format = "%d/%m/%Y %H:%M:%S")
pc <- pc[,c(10,3:9)]

#plot data
png("plot1.png")
hist(pc$Global_active_power,main='Global Active Power',
	xlab='Global Active Power (kilowatts)',col='red')
dev.off()