library(data.table)

#Read data table
dt <- data.table(read.table('exdata-data-household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ';'))

#Ignore ?s
dt[dt=="?"] <- NA

#Pick data for the required days i.e. Feb1 & Feb2, 2007
dt <- subset(dt, as.Date(dt$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(dt$Date, "%d/%m/%Y")=="2007-02-02", na.omit=TRUE)

#convert datatype to numeric
dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))

#Combine date & time
dateTime <- as.POSIXlt(paste(as.Date(dt$Date, format="%d/%m/%Y"), dt$Time, sep=" "))

#plot it
png("plot2.png", width=480, height=480, units="px")

par(pch=46) #dot is the printed char
with(dt, plot(dateTime, dt$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)"))
with(dt, lines(dateTime, dt$Global_active_power))

dev.off()