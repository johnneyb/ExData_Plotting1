# Plot = 01. Global active power.
# ===============================

library(dplyr)

plot_01 <- function(date_01, date_02){
    print('Start date (inclusive_....: ')
    print(date_01)
    
    print('End date (inclusive_......: ')
    print (date_02)

    plot_data_01 <- read.csv("household_power_consumption.txt", sep=';')
    
    print(head(plot_data_01))
    
    plot_data_02 <- filter(plot_data_01, 
                           as.Date(Date, "%d/%m/%Y") == date_01 |
                           as.Date(Date, "%d/%m/%Y") == date_02)
                               
    
    write.csv(plot_data_02, 'plot_01.csv')
    plot_data_02 <- read.csv("plot_01.csv", sep=',')
    print(head(plot_data_02))
    
    print(NROW(plot_data_02))
    jj <- select(plot_data_02, Global_active_power)

    print(head(jj))
   # dev.off()
    hist(as.numeric(jj$Global_active_power),
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", 
         border="blue", 
         col="green",
         breaks=seq(0,10,by=0.5)) 
    
    dev.copy(png, file="plot_02.png", height=480, width=480)
    dev.off()
}