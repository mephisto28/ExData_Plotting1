#load data
pc <- read.table("hpc.txt", header = TRUE, sep = ";", na.string = "?", colClasses = c(rep("character",2),rep("numeric",7)),  comment.char = "")
pc <- pc[pc$Date == "1/2/2007" | pc$Date == "2/2/2007",]

#tidy data
pc$DateTime <- strptime(paste(pc$Date,pc$Time),format = "%d/%m/%Y %H:%M:%S")
pc <- pc[,c(10,3:9)]

#plot data
png("plot2.png")
plot(pc$DateTime,pc$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()