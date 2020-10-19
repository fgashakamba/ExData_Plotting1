# Read data into a variable called "All_data"

All_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset the data to the period specified in the assignment:  From 2007-02-01 to 2007-02-02
data1 <- subset(All_data, Date %in% c("1/2/2007","2/2/2007"))

# Format the data appropriately
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# Construct a histogram that show the power consumption in this period
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Copy the graph to the PNG device
dev.copy(device = png, file = "plot1.png")