# Save text file into directory "ExData_Plotting1"

df <- read.table("./ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(as.character(df$Date),"%d/%m/%Y") #Capital Y means 4 digits, not 2
df <- subset(df,df$Date=="2007-02-01" | df$Date=="2007-02-02")

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

df$Date_and_Time <- as.POSIXct(paste(df$Date, as.character(df$Time)), format="%Y-%m-%d %H:%M:%S") 
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))

#Plot 4: 
###########
par(mfrow = c(2,2))

# Plot 4.1
plot(df$Date_and_Time,df$Global_active_power,type="l", xlab = "", ylab = "Global Active Power")

# Plot 4.2
plot(df$Date_and_Time,df$Voltage,type="l", xlab = "datetime", ylab = "Voltage")

# Plot 4.3
yrange <- range(c(df$Sub_metering_1,df$Sub_metering_2,df$Sub_metering_3))
plot(df$Date_and_Time,df$Sub_metering_1,type="l",ylim=yrange, xlab = "", ylab = "Energy sub metering")
lines(df$Date_and_Time,df$Sub_metering_2, col = "red")
lines(df$Date_and_Time,df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", xjust = 1, yjust = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4.4
plot(df$Date_and_Time,df$Global_reactive_power,
     type="l", xlab = "datetime", 
     ylab = "Global_reactive_power")

################
dev.copy(png, file = "Plot4.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!


