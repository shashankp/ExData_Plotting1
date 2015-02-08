library(data.table)

#Read data table
dt <- data.table(read.table('exdata-data-household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ';'))

#Pick data for the required days i.e. Feb1 & Feb2, 2007
dt <- dt[Date %in% c("1/2/2007", "2/2/2007")]

#Ignore ?s
dt[dt=="?"] <- NA

#Merge date & time
dateTime <- as.POSIXlt(paste(as.Date(dt$Date, format="%d/%m/%Y"), dt$Time, sep=" "))

#plot
png("plot3.png", width=480, height=480, units="px")

with(dt, plot(dateTime, as.numeric(as.character(dt$Sub_metering_1)), xlab="", ylab="Energy sub metering", pch=46))
with(dt, lines(dateTime, as.numeric(as.character(dt$Sub_metering_1))))
with(dt, lines(dateTime, as.numeric(as.character(dt$Sub_metering_2)), col="red"))
with(dt, lines(dateTime, as.numeric(as.character(dt$Sub_metering_3)), col="blue"))

legend("topright", lty=c(1,1), col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

