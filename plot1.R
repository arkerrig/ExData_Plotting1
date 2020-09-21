df <- read.csv("household_power_consumption.txt",header=TRUE,sep=";")
#df$datetime <- as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")

df_focus <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_focus$Global_active_power <- as.numeric(df_focus$Global_active_power)

if(dev.cur() == 1){
  dev.new()
}

png(filename="plot1.png")
hist(df_focus$Global_active_power,xlab="Global Active Power (kiowatts)",ylab="Frequency",main="Global Active Power",col="red",breaks=15)
dev.off()