#read data
a <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
b <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
subsetdata <- read.table('household_power_consumption.txt', sep = ';', na.strings = '?', skip = a, nrows = b-a-1)
head <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1,sep = ';')
c <- as.vector(t(head))
colnames(subsetdata) <- c
rm(a)
rm(b)
rm(c)
rm(head)
#plot&save to png
hist(subsetdata$Global_active_power,col = 'red',xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')
dev.copy(png,'plot1.png')
dev.off()