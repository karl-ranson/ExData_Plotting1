
# Save text file into directory "ExData_Plotting1"

df <- read.table("./ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(as.character(df$Date),"%d/%m/%Y") #Capital Y means 4 digits, not 2
df <- subset(df,df$Date=="2007-02-01" | df$Date=="2007-02-02")

#Plot 1
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

hist(df$Global_active_power, 
     main = paste("Global Active Power"),
     col = "red",xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot1.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!



