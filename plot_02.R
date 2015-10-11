# Plot = 02. Global active power versus time.
# ===========================================

library(dplyr)

plot_02 <- function(date_01, date_02){
    print('Start date (inclusive_....: ')
    print(date_01)
    
    print('End date (inclusive_......: ')
    print (date_02)
    
#    plot_data_01 <- read.csv("household_power_consumption.txt", sep=';')
    
#    print(head(plot_data_01))
   
#    plot_data_02 <- filter(plot_data_01, 
#                           as.Date(Date, "%d/%m/%Y") == date_01 |
#                           as.Date(Date, "%d/%m/%Y") == date_02)
    
    
#    write.csv(plot_data_02, 'plot_02.csv')
    plot_data_03 <- read.csv("plot_02.csv", sep=',')
    print(head(plot_data_03))
    
    print(NROW(plot_data_03))
    
    jj <- select(plot_data_03, Global_active_power, Date, Time)
    print(head(jj))
    

    datetime <- paste(as.Date(jj$Date, "%d/%m/%Y"), jj$Time)
    print (head(datetime))
    
    jj$Datetime <- as.POSIXct(datetime)
    
    print(head(jj))
    
    ## Plot 2
    
    plot(jj$Global_active_power~jj$Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    dev.copy(png, file="plot_02.png", height=480, width=480)
    dev.off()
}
