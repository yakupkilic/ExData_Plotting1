## This R-file plots the Plot2 of project assignment-1 for Exploratory Data Analysis Course
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

# 2-Set the time/date variable

q<-paste(data$V1,data$V2)
dateVAR<-strptime(q,"%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "C") ## to set system language to English

# 3-Plot the variations of Global Active Power

ylab<-"Global Active Power (kilowatts)"
plot(dateVAR,data$V3,main="",xlab="",ylab=ylab,col="black",type="l",bg="transparent")

# 4-Saveas PNG file

dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()



