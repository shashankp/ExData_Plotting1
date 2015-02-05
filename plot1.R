library(data.table)

#Read data table
dt <- data.table(read.table('exdata-data-household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ';'))

#Ignore ?s
dt[dt=="?"] <- NA

#Pick data for the required days i.e. Feb1 & Feb2, 2007
required_dt <- subset(dt, as.Date(dt$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(dt$Date, "%d/%m/%Y")=="2007-02-02", na.omit=TRUE)

#convert datatype to numeric
gap <- as.numeric(as.character(required_dt$Global_active_power))

#Save Histogram as PNG
png("plot1.png", width=480, height=480, units="px")
hist(gap, main="Global Active Power", xlab = "Global Active Power (kilowatts)",col = 'RED')
dev.off()