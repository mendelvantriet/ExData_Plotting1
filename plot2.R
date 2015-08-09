# Our overall goal here is simply to examine how household energy usage varies 
# over a 2-day period in February, 2007. Your task is to reconstruct the 
# following plots below, all of which were constructed using the base plotting 
# system.

datafile <- "household_power_consumption.txt"
header <- read.table(datafile, nrows=1, header=FALSE, sep=';', stringsAsFactors=FALSE)
df <- read.table(datafile, skip=66600, nrows=10000, header=FALSE, sep=';', 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), 
                 na.strings="?", comment.char="")
colnames(df) <- unlist(header)

df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]


png("plot2.png")
Sys.setlocale("LC_TIME", 'en_GB.UTF-8')
plot(as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"), df$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

