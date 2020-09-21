df <- read.csv("household_power_consumption.txt",header=TRUE,sep=";")

df_focus <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_focus$Global_active_power <- as.numeric(df_focus$Global_active_power)

if(dev.cur() == 1){
  dev.new()
}

png(file="plot4.png")

par(mfrow=c(2,2))


#Top Left chart

plot(df_focus$Global_active_power,type="l",xaxt="n", xlab="",ylab="Global Active Power (kiowatts)")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))

#Top Right chart

plot(df_focus$Voltage,type="l",xaxt="n", xlab="datetime", ylab="Voltage")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))


#Bottom left chart
plot(df_focus$Sub_metering_1,type="l",xaxt="n", xlab="", ylab="Energy sub metering")
lines(df_focus$Sub_metering_2,col="red")
lines(df_focus$Sub_metering_3,col="blue")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


#Bottom Right chart
plot(df_focus$Global_reactive_power,type="l",xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))


dev.off()

