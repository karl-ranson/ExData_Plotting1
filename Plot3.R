# Save text file into directory "ExData_Plotting1"

df <- read.table("./ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(as.character(df$Date),"%d/%m/%Y") #Capital Y means 4 digits, not 2
df <- subset(df,df$Date=="2007-02-01" | df$Date=="2007-02-02")

#Plot 3
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

df$Date_and_Time <- as.POSIXct(paste(df$Date, as.character(df$Time)), format="%Y-%m-%d %H:%M:%S") 
##################################
yrange <- range(c(df$Sub_metering_1,df$Sub_metering_2,df$Sub_metering_3))
plot(df$Date_and_Time,df$Sub_metering_1,type="l",
     ylim=yrange,
     xlab="",
     ylab="Energy sub metering")
lines(df$Date_and_Time,df$Sub_metering_2, col = "red")
lines(df$Date_and_Time,df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, xjust = 1, yjust = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "Plot3.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!


