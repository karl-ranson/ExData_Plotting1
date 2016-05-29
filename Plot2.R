
# Save text file into directory "ExData_Plotting1"

df <- read.table("./ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(as.character(df$Date),"%d/%m/%Y") #Capital Y means 4 digits, not 2
df <- subset(df,df$Date=="2007-02-01" | df$Date=="2007-02-02")

#Plot 2
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Date_and_Time <- as.POSIXct(paste(df$Date, as.character(df$Time)), format="%Y-%m-%d %H:%M:%S") 

plot(df$Date_and_Time,df$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!


