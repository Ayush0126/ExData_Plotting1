install.packages("data.table")
library(data.table)

# Load and prepare the data
data <- fread("household_power_consumption.txt", na.strings = "?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Create plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()