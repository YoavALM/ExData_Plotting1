#-----------------------------------------------------------------------------------------------------------------
# Downloading the raw data from it's URL:
#-----------------------------------------------------------------------------------------------------------------

# Create data folder within working directory (only IF doesn't exist yet)

if(!file.exists("./data")){dir.create("./data")}

# Downloding, unzipping and reading the data for the assignment, from original link:

if(!file.exists("./data/household_power_consumption.zip"))  {
  dataURL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(dataURL,destfile="./data/household_power_consumption.zip")
  unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")
}

power_data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#-----------------------------------------------------------------------------------------------------------------
# Subsetting the data to required dates only, and ajusting classes.
#-----------------------------------------------------------------------------------------------------------------

sub_power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
sub_power_data$Time <- strptime(paste(sub_power_data$Date, sub_power_data$Time), format = "%d/%m/%Y %H:%M:%S")
sub_power_data$Date <- as.Date(sub_power_data$Date, format = '%d/%m/%Y')

#-----------------------------------------------------------------------------------------------------------------
# Plotting plot 2
#-----------------------------------------------------------------------------------------------------------------

with(sub_power_data, plot(Time,Global_active_power,xlab="Day", ylab="Global Active Power (kilowatts)",type = "n"))
with(sub_power_data, lines(Time,Global_active_power))
dev.copy(png,'plot2.png')
dev.off()



