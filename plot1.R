readData <- function(){
        fileName <- "household_power_consumption.txt"
        filePath = paste(getwd(),fileName,sep = "/")
        # print(filePath)
        data <- read.table(filePath,header = TRUE,sep = ";",
                           stringsAsFactors = FALSE,
                           # colClasses = c("Date","Time","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
        )
        # print(colnames(data))
        data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
        # print(head(data))
        
        data$Global_active_power <- as.numeric(data$Global_active_power)
        data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
        data$Voltage <- as.numeric(data$Voltage)
        data$Global_intensity <- as.numeric(data$Global_intensity)
        data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
        data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
        data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
        # print(head(data))
        data        
}
plot1 <- function(data){
        png("plot1.png", width=480, height=480)
        hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off() 
}
run <- function(){
        library(dplyr)
        datasets <- readData()   
        # plot1
        plot1(datasets)
}
run()