## This R-file plots the Plot1 of project assignment-1 for Exploratory Data Analysis Course
## and save it as a .png file 

# 1-Read the data
# i) find the start of the relevant data
# ii) find the number of minutes from the start to end 
# iii) read the data

fileName<-"household_power_consumption.txt"
p <- grep("^1/2/2007", readLines(fileName)) 
nskip<-p[1]
timeDiff<-difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
nRows <- as.numeric(timeDiff)
data<-read.table(fileName,skip=nskip,nrows=nRows,sep=";")

# 2-Plot the histogram for Global Active Power

title<-"Global Active Power"
ylab<-"Frequency"
xlab<-"Global Active Power (kilowatts)"
hist(data$V3,main=title,xlab=xlab,ylab=ylab,col="red", bg="transparent")

# 3-Saveas PNG file

dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()


