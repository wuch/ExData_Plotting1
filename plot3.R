
elec.power.cons = read.table("household_power_consumption.txt", sep=";",
                             header = TRUE, stringsAsFactors = FALSE,
                             na.strings = "?")
elec.power.cons$Time = strptime(paste(elec.power.cons$Date, elec.power.cons$Time),
                                format="%d/%m/%Y %H:%M:%S")
elec.power.cons$Date = as.Date(elec.power.cons$Date, "%d/%m/%Y")

epm.subset = subset(elec.power.cons, Date >= as.Date("2007-02-01", "%Y-%m-%d") &
                      Date <= as.Date("2007-02-02", "%Y-%m-%d"))
png("plot3.png")
xrange = range(epm.subset$Time)
yrange = range(epm.subset$Sub_metering_1, epm.subset$Sub_metering_2,
               epm.subset$Sub_metering_3)

plot(xrange, yrange, type="n", ylab = "Energy sub metering", xlab = "")
cols = c("grey40", "red", "blue")
lines(epm.subset$Time, epm.subset$Sub_metering_1, col=cols[1])
lines(epm.subset$Time, epm.subset$Sub_metering_2, col=cols[2])
lines(epm.subset$Time, epm.subset$Sub_metering_3, col=cols[3])
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=cols, cex=0.8, bty = "n", lty=1)

dev.off()
