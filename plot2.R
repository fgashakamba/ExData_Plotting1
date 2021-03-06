# Read data into a variable called "All_data"
All_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset the data according to the indicated period
data1 <- subset(All_data, Date %in% c("1/2/2007","2/2/2007"))

# Format the data appropriately
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Construct a plot visualizing the global weekly power consumption
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

# Copy data to the PNG device
dev.copy(device = png, file = "plot2.png")