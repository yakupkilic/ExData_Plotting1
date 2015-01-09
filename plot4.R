## This R-file plots the Plot4 of project assignment-1 for Exploratory Data Analysis Course
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

## 3-PLOT 4 FIGURES
par(mfrow=c(2,2))

# 3.1 -Plot the variations of Global Active Power for different days 

ylab<-"Global Active Power (kilowatts)"
plot(dateVAR,data$V3,main="",xlab="",ylab=ylab,col="black",type="l",bg="transparent")

# 3.2 -Plot the variations of Voltage for different days

ylab<-"Voltage"
xlab<-"datetime"
plot(dateVAR,data$V5,main="",xlab=xlab,ylab=ylab,col="black",type="l",bg="transparent",ylim=c(234,246))

## 3.3 -Plot the Energy sub metering for different days

ylab<-"Energy sub metering"
colors<-c("black","red","blue")
plot(dateVAR,data$V7,main="",type="n",xlab="",ylab=ylab,bg="transparent")
lines(dateVAR,data$V7,col=colors[1])
lines(dateVAR,data$V8,col=colors[2])
lines(dateVAR,data$V9,col=colors[3])
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=colors,lty=1,bty="n",cex=0.95)

## 3.4 -Plot the variations of Global_reactive_power for different days

ylab<-"Global_reactive_power"
xlab<-"datetime"
plot(dateVAR,data$V4,main="",xlab=xlab,ylab=ylab,col="black",type="s",bg="transparent",ylim=c(0,0.5))

# 4-Saveas PNG file

dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()
