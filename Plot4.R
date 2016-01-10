
setwd("C:/Users/Chris/datasciencecoursera/ExploritoryDataAnalysis")
quizdata <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

#Create a datetime column for plotting
quizdata$datetime<-strptime(paste(as.Date(quizdata$Date,"%d/%m/%Y"),quizdata$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

#Clean & flter the data to just what we need
q<-quizdata[quizdata$Global_active_power !="?",]
q<-q[q$datetime >="2007-02-01 00:00:00" & q$datetime < "2007-02-03 00:00:00",]
q<-q[!is.na(q$datetime),]

#Fix up the column types
q$Global_active_power=as.numeric(as.character(q$Global_active_power))
q$Global_reactive_power=as.numeric(as.character(q$Global_reactive_power))
q$Voltage=as.numeric(as.character(q$Voltage))
q$Sub_metering_1=as.numeric(as.character(q$Sub_metering_1))
q$Sub_metering_2=as.numeric(as.character(q$Sub_metering_2))


setwd("C:/Users/Chris/datasciencecoursera/ExploritoryDataAnalysis/ExData_Plotting1")

#Create plots and send to device

png(file="Plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0),cex=0.7,cex.axis=0.8)
with(q,{
  plot(datetime,q$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(datetime,q$Voltage,type="l",ylab="Voltage",xlab="")
  
  plot(datetime,q$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")
  lines(datetime,q$Sub_metering_2,col="red")
  lines(datetime,q$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(datetime,q$Global_reactive_power,type="l",ylab="Global_reactive_power")
  
}
)
dev.off()
