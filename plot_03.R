# Plot = 03. Global active power versus sub-metering.
# ==================================================

library(dplyr)

    plot_03 <- function(date_01, date_02){
    print('Start date (inclusive_....: ')
    print(date_01)
    
    print('End date (inclusive_......: ')
    print (date_02)
    
    plot_data_03 <- read.csv("household_power_consumption.txt", sep=';')
    print(head(plot_data_03))
    plot_data_04 <- filter(plot_data_03, 
                           as.Date(Date, "%d/%m/%Y") == date_01 |
                           as.Date(Date, "%d/%m/%Y") == date_02)

    write.csv(plot_data_04, 'plot_03.csv')
    print(head(plot_data_03))
    plot_data_06 <- read.csv("plot_03.csv", sep=',')
    print(head(plot_data_06))
    print(NROW(plot_data_06))
    jj <- select(plot_data_06, Global_active_power, Date, Time,Sub_metering_1,Sub_metering_2,Sub_metering_3)

    datetime <- paste(as.Date(jj$Date, "%d/%m/%Y"), jj$Time)

    jj$Datetime <- as.POSIXct(datetime)

    print(head(jj))

    ## Plot 3
    with(jj, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Green')
        lines(Sub_metering_3~Datetime,col='Blue')
    })
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.copy(png, file="plot_03.png", height=480, width=480)
    dev.off()
}