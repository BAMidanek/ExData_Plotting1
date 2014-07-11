
plot1 <- function() {
      
      if(!file.exists("./data")) {dir.create("./data")}
    
    if(!file.exists("./data/household_power_consumption.zip")) {
          fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
          download.file(fileUrl, destfile="./data/household_power_consumption.zip")
    }
    
    if (!file.exists("./household_power_consumption.zip")) {
          unzip("./data/household_power_consumption.zip")      
    }
    
    hh.power <- read.table("household_power_consumption.txt", nrows=500000, header=T, sep=";", na.strings="?")
    
    hh.feb1 <- hh.power[hh.power$Date == "1/2/2007",]
    hh.feb2 <- hh.power[hh.power$Date == "2/2/2007",]
    hh.feb <- rbind(hh.feb1, hh.feb2)
    
    hh.feb[,1:2] <- sapply(hh.feb[,1:2], as.character)
    
    hh.feb$date.time <- paste(hh.feb$Date, hh.feb$Time, sep=" ")
    hh.feb$full.date <- strptime(hh.feb$date.time, "%d/%m/%Y %H:%M:%S")
    
    ### GRAPH 1
    png(filename="./data/plot1.png")
    plot.new()
    hist(hh.feb$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", breaks=12, axis(2, at=200))
    dev.off()      
}

plot1()
