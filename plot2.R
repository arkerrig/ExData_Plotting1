df <- read.csv("household_power_consumption.txt",header=TRUE,sep=";")

df_focus <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_focus$Global_active_power <- as.numeric(df_focus$Global_active_power)

if(dev.cur() == 1){
  dev.new()
}

png(file="plot2.png")
plot(df_focus$Global_active_power,type="l",xaxt="n", xlab="", ylab="Global Active Power (kiowatts)")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
dev.off()

