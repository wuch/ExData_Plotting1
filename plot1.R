
elec.power.cons = read.table("household_power_consumption.txt", sep=";",
                             header = TRUE, stringsAsFactors = FALSE,
                             na.strings = "?")
elec.power.cons$Time = strptime(paste(elec.power.cons$Date, elec.power.cons$Time),
                                format="%d/%m/%Y %H:%M:%S")
elec.power.cons$Date = as.Date(elec.power.cons$Date, "%d/%m/%Y")

epm.subset = subset(elec.power.cons, Date >= as.Date("2007-02-01", "%Y-%m-%d") &
                      Date <= as.Date("2007-02-02", "%Y-%m-%d"))
png("plot1.png")
hist(epm.subset$Global_active_power, col="red", main="Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()
