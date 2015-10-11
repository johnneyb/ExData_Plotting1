# Plot = 04. Four plots on the same page..
# ==================================================

library(dplyr)

plot_04 <- function(date_01, date_02){
    print('Start date (inclusive_....: ')
    print(date_01)
    print('End date (inclusive_......: ')
    print (date_02)
    print (date_02)
    
    plot_data_01 <- read.csv("household_power_consumption.txt", sep=';')
    print(head(plot_data_01))
    
    plot_data_02 <- filter(plot_data_01, 
                            as.Date(Date, "%d/%m/%Y") == date_01 |
                            as.Date(Date, "%d/%m/%Y") == date_02)
    
    write.csv(plot_data_02, 'plot_04.csv')
    plot_data_03 <- read.csv("plot_04.csv", sep=',')
    print(head(plot_data_03))
        
    datetime <- strptime(paste(plot_data_03$Date, plot_data_03$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    globalActivePower <- as.numeric(plot_data_03$Global_active_power)
    globalReactivePower <- as.numeric(plot_data_03$Global_reactive_power)
    voltage <- as.numeric(plot_data_03$Voltage)
    subMetering1 <- as.numeric(plot_data_03$Sub_metering_1)
    subMetering2 <- as.numeric(plot_data_03$Sub_metering_2)
    subMetering3 <- as.numeric(plot_data_03$Sub_metering_3)

    png("plot_04.png", width=480, height=480)
    par(mfrow = c(2, 2)) 

    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

    plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

    plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.copy(png, file="plot_04.png", height=480, width=480)
    dev.off()
}